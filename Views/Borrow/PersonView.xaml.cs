using LibraryManagementApplication.Models;
using LibraryManagementApplication.ViewModels;
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

namespace LibraryManagementApplication.Views.Borrow
{
    /// <summary>
    /// Interaction logic for PersonView.xaml
    /// </summary>
    public partial class PersonView : Window
    {
        int lastid=0;
        int UpdateId=0;
        public PersonView()
        {
            InitializeComponent();
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
        async void GetdatagridItems()
        {
            PersonDatabase a = new PersonDatabase();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }
        void clear()
        {
            GetdatagridItems();
            txtFullname.Focus();
            txtFullname.Text = "";
            txtAge.Text = "";
            txtCart.Text = "";
            txtGender.SelectedIndex = 0;
            txtPhone.Text = "";
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            txtFullname.Focus();
            AccountViewModel a = new AccountViewModel();
            var lid = await a.GetScalerValueAsync("select isnull(max(PersonId),0) from Person");
            lastid = int.Parse(lid) + 1;
        }

        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtFullname.Text == "" || txtFullname.Text == null)
                {
                    txtFullname.Focus();
                    throw new System.Exception("Fullname must be inserted");
                }
                if (txtPhone.Text == "" || txtPhone.Text == null)
                {
                    txtPhone.Focus();
                    throw new System.Exception("Phone must be inserted");
                }
                if (txtAge.Text == "" || txtAge.Text == null)
                {
                    txtAge.Focus();
                    throw new System.Exception("Age must be inserted");
                }
                if (txtCart.Text == "" || txtCart.Text == null)
                {
                    txtCart.Focus();
                    throw new System.Exception("Cart-id must be inserted");
                }
                Person person= new Person();
                PersonDatabase personDatabase= new PersonDatabase();
                var lid = await personDatabase.GetScalerValueAsync("select isnull(max(PersonId),0) from Person");
                lastid = int.Parse(lid) + 1;
                person.PersonId = lastid;
                person.FullName = txtFullname.Text;
                person.Age = int.Parse(txtAge.Text);
                person.Gender= txtGender.Text;
                person.Phone= txtPhone.Text;
                person.CartId = txtCart.Text;
                await personDatabase.ExcuteAsyncWithParameters("insert into Person values(@id,@full,@gen,@age,@phone,@cart)",
                     new Dictionary<string, object> {
                        {"@id",person.PersonId },
                        {"@full",person.FullName },
                        {"@gen",person.Gender },
                        {"@age",person.Age },
                        {"@phone",person.Phone},
                        {"@cart",person.CartId },
                     });
                clear();
                //AccountDatagrid.ItemsSource = await personDatabase.GetAccountsAsync();

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
                #region Validation
                if (txtFullname.Text == "" || txtFullname.Text == null)
                {
                    txtFullname.Focus();
                    throw new System.Exception("Fullname must be inserted");
                }
                if (txtAge.Text == "" || txtAge.Text == null)
                {
                    txtAge.Focus();
                    throw new System.Exception("Age must be inserted");
                }
                if (txtCart.Text == "" || txtCart.Text == null)
                {
                    txtCart.Focus();
                    throw new System.Exception("cart-id must be inserted");
                }
                if (txtPhone.Text == "" || txtPhone.Text == null)
                {
                    txtPhone.Focus();
                    throw new System.Exception("Phone must be inserted");
                } 
                #endregion
                Person person = new Person();
                PersonDatabase personDatabase= new PersonDatabase();
                #region check_if_exist

                int count = int.Parse(await personDatabase.GetScalerValueAsync($"select count(PersonId) from Person where PersonId= {UpdateId}"));
                if (count == 0 || count < 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                } 
                #endregion
                person.PersonId = UpdateId;
                person.FullName = txtFullname.Text;
                person.Phone = txtPhone.Text;
                person.Age = int.Parse(txtAge.Text);
                person.CartId = txtCart.Text;
                person.Gender = txtGender.Text;
                await personDatabase.ExcuteAsyncWithParameters(@"update Person set FullName=@full, Gender = @gen, Age=@age, Phone=@phone,
                                                                    CartId=@cart where PersonId=@id",
                     new Dictionary<string, object> {
                        {"@id",UpdateId},
                        {"@full",person.FullName },
                        {"@gen",person.Gender },
                        {"@age",person.Age },
                        {"@phone",person.Phone },
                        {"@cart",person.CartId },
                     });
                UpdateId = 0;
                AccountDatagrid.ItemsSource = await personDatabase.GetAccountsAsync();
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
                PersonDatabase personDatabase= new PersonDatabase();
                await personDatabase.ExcuteAsyncWithParameters("delete from Person where PersonId=@id",
                    new Dictionary<string, object> {
                    {"@id",UpdateId }}
                    );
                clear();
                MessageBox.Show("deleted successfully");
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        private async void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            lblSearch.Visibility = Visibility.Visible;
            Person person= new Person();
            #region search_check_if_null_exist
            if (txtFullname.Text == null || txtFullname.Text == "")
            {
                person.FullName = null;
            }
            else
            {
                person.FullName = txtFullname.Text;

            }
            if (txtPhone.Text == null || txtPhone.Text == "")
            {
                person.Phone = null;

            }
            else
            {
                person.Phone = txtPhone.Text;
            }
            if (txtCart.Text == "" || txtCart.Text == null)
            {
                person.CartId = null;
            }
            else
            {
                person.CartId = txtCart.Text;
            } 
            #endregion
            PersonDatabase personDatabase= new PersonDatabase();
            var acc = await personDatabase.GetFilteredAccountsAsync(new Dictionary<string, object>
            {
                {"@name",person.FullName},
                {"@cart",person.CartId },
                {"@phone",person.Phone}
            });
            AccountDatagrid.ItemsSource = acc;
        }
        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            clear();
        }
        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            var selected = (Person)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                UpdateId = selected.PersonId;
                txtFullname.Text = selected.FullName;
                txtAge.Text = selected.Age.ToString();
                txtCart.Text = selected.CartId;
                txtGender.Text = selected.Gender;
                txtPhone.Text = selected.Phone;
            }
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
