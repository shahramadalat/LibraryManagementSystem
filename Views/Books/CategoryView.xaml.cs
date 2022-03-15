using LibraryManagementApplication.Models;
using LibraryManagementApplication.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LibraryManagementApplication.Views.Books
{
    /// <summary>
    /// Interaction logic for CategoryView.xaml
    /// </summary>
    public partial class CategoryView : Window
    {
        public int UpdateId;

        public CategoryView()
        {
            InitializeComponent();
        }
        async void GetdatagridItems()
        {
            CategoreyViewModel a = new CategoreyViewModel();
            AccountDatagrid.ItemsSource = await a.GetItemsAsync();
        }
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
        }

        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtCategory.Text == "" || txtCategory.Text == null)
                {
                    txtCategory.Focus();
                    throw new System.Exception("Categorey must be inserted");
                }
                Categorey item = new Categorey();
                item.CategoreyName = txtCategory.Text;
                CategoreyViewModel categoreyViewModel = new CategoreyViewModel();
                await categoreyViewModel.ExcuteAsyncWithParameters("insert into Categorey values(@cat)",
                     new Dictionary<string, object> {
                        {"@cat",item.CategoreyName }
                     });
                AccountDatagrid.ItemsSource = await categoreyViewModel.GetItemsAsync();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtCategory.Text == "" || txtCategory.Text == null)
                {
                    txtCategory.Focus();
                    throw new System.Exception("Categorey must be inserted");
                }

                Categorey categorey = new Models.Categorey();
                CategoreyViewModel categoreyViewModel = new CategoreyViewModel();
                int count = int.Parse(await categoreyViewModel.GetScalerValueAsync($"select count(CategoreyId) from Categorey where CategoreyId = {UpdateId}"));
                if (count == 0 || count < 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                }

                categorey.CategoreyId = UpdateId;
                categorey.CategoreyName = txtCategory.Text;
                await categoreyViewModel.ExcuteAsyncWithParameters(@"update Categorey set CategoreyName=@cat where CategoreyId=@id",
                     new Dictionary<string, object> {
                        {"@id",categorey.CategoreyId},
                        {"@cat",categorey.CategoreyName},
                     });
                UpdateId = 0;
                AccountDatagrid.ItemsSource = await categoreyViewModel.GetItemsAsync();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBoxResult mr = MessageBox.Show("Are you sure to delete this? ", "Quetion", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (mr.Equals(MessageBoxResult.Yes))
                {
                    CategoreyViewModel categoreyViewModel = new CategoreyViewModel();
                    await categoreyViewModel.ExcuteAsyncWithParameters("delete from Categorey where CategoreyId=@id",
                        new Dictionary<string, object> {
                    {"@id",UpdateId }}
                        );
                    MessageBox.Show("deleted");
                }
                else
                {
                    MessageBox.Show("not deleted");
                }

            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }

            GetdatagridItems();
            clear();

        }
        void clear()
        {

            txtCategory.Text = "";

        }
        private async void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            lblSearch.Visibility = Visibility.Visible;
            Categorey categorey = new Categorey();
            categorey.CategoreyName = txtCategory.Text;
            CategoreyViewModel categoreyViewModel = new CategoreyViewModel();
            var item = await categoreyViewModel.GetFilteredAccountsAsync(new Dictionary<string, object>
            {
                {"@cat",categorey.CategoreyName}
            });
            AccountDatagrid.ItemsSource = item;
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            clear();
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            var selected = (Categorey)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                UpdateId = selected.CategoreyId;
                txtCategory.Text = selected.CategoreyName;
                chosen_Language = selected.CategoreyName;
            }
        }
        string chosen_Language;
        private void btnChoose_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (chosen_Language == "" || chosen_Language == null || UpdateId == 0 || UpdateId == null)
                {
                    throw new Exception("please ensure to choose a record, try again");
                }
                BooksView.CategoryId = UpdateId;
                BooksView.Category = chosen_Language;
                this.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
