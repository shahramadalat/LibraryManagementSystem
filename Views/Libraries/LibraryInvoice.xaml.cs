using LibraryManagementApplication.Models;
using LibraryManagementApplication.ViewModels;
using LibraryManagementApplication.Views.Books;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LibraryManagementApplication.Views.Libraries
{
    /// <summary>
    /// Interaction logic for LibraryInvoice.xaml
    /// </summary>
    public partial class LibraryInvoice : Window
    {
        int lastid = 0;
        int UpdateId = 0;
        int? LibraryInvoiceId = 0;
        public static int BookId = 0;
        public static string BookName = "";
        int AccountId = 0;
        public LibraryInvoice()
        {
            InitializeComponent();
        }
        async void GetdatagridItems()
        {
            LibraryInvoiceViewModel a = new LibraryInvoiceViewModel();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
        }
        void clear()        {
            btnChooseBook.Focus();
            txtBookName.Text = "";
            BookName = "";
            BookId = 0;
            txtInvoiceId.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            //txtDate.Text = "";
        }
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtBookName.Text == "" || txtBookName.Text == null || BookId == 0 || BookId == null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book must be selected");
                }
                if (txtPrice.Text == "" || txtPrice.Text == null)
                {
                    txtPrice.Focus();
                    throw new System.Exception("Book price must be inserted");
                }
                if (txtQuantity.Text == "" || txtQuantity.Text == null)
                {
                    txtQuantity.Focus();
                    throw new System.Exception("Quantity must be inserted");
                }
                //if (txtDate.Text==null || txtDate.Text=="")
                //{
                //    txtDate.Focus();
                //    throw new System.Exception("Date must be inserted");
                //}
                LibraryInvoiceViewModel libraryInvoiceViewModel = new LibraryInvoiceViewModel();
                var lid = await libraryInvoiceViewModel.GetScalerValueAsync("select isnull(max(LibraryId),0) from Library");
                lastid = int.Parse(lid) + 1;
                var CountInvoiceId = await libraryInvoiceViewModel.GetScalerValueAsync($"select count(LibraryInvoiceId) from LibraryInvoice where LibraryInvoiceId={txtInvoiceId.Text}");
                if (int.Parse(CountInvoiceId)==0)
                {
                    throw new Exception("This invoice id isn't available");
                }
                LibraryInvoiceModel libraryNote = new LibraryInvoiceModel();
                libraryNote.LibraryId = lastid;
                libraryNote.Quantity = int.Parse(txtQuantity.Text);
                libraryNote.BookPrice = int.Parse(txtPrice.Text);
                libraryNote.BookId = BookId;
                libraryNote.LibraryInvoiceId = int.Parse(txtInvoiceId.Text);
                
                
                await libraryInvoiceViewModel.ExcuteAsyncWithParameters("insert into Library values(@id,@bookid,@quant,@invoiceid,@bookprice)",
                     new Dictionary<string, object> {
                        {"@id",libraryNote.LibraryId },
                        {"@bookid",libraryNote.BookId },
                        {"@invoiceid",libraryNote.LibraryInvoiceId },
                        {"@quant",libraryNote.Quantity },
                        {"@bookprice",libraryNote.BookPrice},
                     });
                clear();
                AccountDatagrid.ItemsSource = await libraryInvoiceViewModel.GetAccountsAsync();
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
                if (txtBookName.Text == "" || txtBookName.Text == null || BookId == 0 || BookId == null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book must be selected");
                }
                if (txtPrice.Text == "" || txtPrice.Text == null)
                {
                    txtPrice.Focus();
                    throw new System.Exception("Book price must be inserted");
                }
                if (txtQuantity.Text == "" || txtQuantity.Text == null)
                {
                    txtQuantity.Focus();
                    throw new System.Exception("Quantity must be inserted");
                }
                if (UpdateId == 0 || UpdateId == null)
                {
                    throw new Exception("an error occured please try again");
                }
                if (LibraryInvoiceId==0||LibraryInvoiceId==null)
                {
                    throw new Exception("an error occured please try again");
                }
                LibraryInvoiceModel libraryNote = new LibraryInvoiceModel();
                LibraryInvoiceViewModel libraryNoteViewModel = new LibraryInvoiceViewModel();
                int count = int.Parse(await libraryNoteViewModel.GetScalerValueAsync($"select count(LibraryId) from Library where LibraryId = {UpdateId}"));
                if (count == 0 || count < 1 || count > 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                }
                libraryNote.LibraryId = UpdateId;
                libraryNote.Quantity = int.Parse(txtQuantity.Text);
                libraryNote.BookPrice = int.Parse(txtPrice.Text);
                libraryNote.BookId = BookId;
                libraryNote.LibraryInvoiceId = int.Parse(txtInvoiceId.Text);
                await libraryNoteViewModel.ExcuteAsyncWithParameters(@"update Library set BookId=@bookid, Quantity=@quant,LibraryInvoiceId=@invoiceId,BookPrice=@price where LibraryId=@id",
                     new Dictionary<string, object> {
                        {"@id",libraryNote.LibraryId },
                        {"@bookid",libraryNote.BookId },
                        {"@quant",libraryNote.Quantity },
                        {"@invoiceId",libraryNote.LibraryInvoiceId },
                        {"@price",libraryNote.BookPrice },
                     });
                
                UpdateId = 0;
                AccountDatagrid.ItemsSource = await libraryNoteViewModel.GetAccountsAsync();
                MessageBox.Show("updated successfully.");
                clear();

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
                LibraryInvoiceViewModel libraryNoteViewModel = new LibraryInvoiceViewModel();
                await libraryNoteViewModel.ExcuteAsyncWithParameters("delete from Library where LibraryId=@id",
                    new Dictionary<string, object> {
                    {"@id",UpdateId }}
                    );

            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            GetdatagridItems();
            clear();
        }

        private async void btnSearch_Click(object sender, RoutedEventArgs e)
        {

            #region validation for search

            lblSearch.Visibility = Visibility.Visible;
            LibraryInvoiceModel item = new LibraryInvoiceModel();
            if (txtBookName.Text == null || txtBookName.Text == "")
            {
                item.BookName = null;
            }
            else
            {
                item.BookName = txtBookName.Text;
            }
            if (txtDate.Text == null || txtDate.Text == "")
            {
                item.Date = null;
            }
            else
            {
                item.Date =DateTime.Parse(txtDate.Text);
            }
            if (txtInvoiceId.Text==""||txtInvoiceId.Text==null)
            {
                item.LibraryInvoiceId = null;
            }
            else
            {
                item.LibraryInvoiceId = int.Parse(txtInvoiceId.Text);
            }
            #endregion
            try
            {
                LibraryInvoiceViewModel libraryInvoiceViewModel = new LibraryInvoiceViewModel();
                var acc = await libraryInvoiceViewModel.GetFilteredAccountsAsync(new Dictionary<string, object>
                 {
                    {"@name",item.BookName},
                    {"@invoiceId",item.LibraryInvoiceId.ToString()},
                    {"@date",item.Date },
                });
                    AccountDatagrid.ItemsSource = acc;
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            clear();
        }

        private void btnChooseBook_Click(object sender, RoutedEventArgs e)
        {
            BooksView booksView = new BooksView("fromLibraryInvoice");
            booksView.ShowDialog();
            txtBookName.Text = BookName;
        }

        private void btnChoose_Click(object sender, RoutedEventArgs e)
        {

        }

        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            var selected = (LibraryInvoiceModel)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                LibraryInvoiceId = selected.LibraryInvoiceId;
                UpdateId = selected.LibraryId;
                txtBookName.Text = selected.BookName;
                BookId = selected.BookId;
                txtQuantity.Text = selected.Quantity.ToString();
                txtPrice.Text = selected.BookPrice.ToString();
                txtInvoiceId.Text = selected.LibraryInvoiceId.ToString();
                txtDate.Text = selected.Date.ToString();

            }
        }

        private async void btnUpdateInvoice_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtDate.Text=="" ||txtDate.Text==null)
                {
                    throw new Exception("Date must be inserted");
                }

                LibraryInvoiceModel libraryNote = new LibraryInvoiceModel();
                LibraryInvoiceViewModel libraryNoteViewModel = new LibraryInvoiceViewModel();
                int count = int.Parse(await libraryNoteViewModel.GetScalerValueAsync($"select count(LibraryInvoiceId) from LibraryInvoice where LibraryInvoiceId = {LibraryInvoiceId}"));
                if (count == 0 || count < 1 || count > 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                }
                libraryNote.LibraryInvoiceId = UpdateId;
                libraryNote.Date = txtDate.SelectedDate;
                

                libraryNote.LibraryInvoiceId = int.Parse(txtInvoiceId.Text);
                await libraryNoteViewModel.ExcuteAsyncWithParameters(@"update LibraryInvoice set Date=@date where LibraryInvoiceId=@id",
                     new Dictionary<string, object> {
                        {"@id",libraryNote.LibraryInvoiceId },
                        {"@date",libraryNote.Date }
                     });
                LibraryInvoiceId = 0;
                AccountDatagrid.ItemsSource = await libraryNoteViewModel.GetAccountsAsync();
                MessageBox.Show("updated successfully.");
                clear();

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
