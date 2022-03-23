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

namespace LibraryManagementApplication.Views.Borrow
{
    /// <summary>
    /// Interaction logic for AddBorrowView.xaml
    /// </summary>
    public partial class AddBorrowView : Window
    {
        public static int? BookId = 0;
        public static int PersonId=0;
        public static string BookName,PersonName="";
        int lastid = 0;
        int? BorrowInvoiceId = 0;
        int BooksLimit, ReturnLimit;
        int UpdateId = 0;
        int AccountId = Home.UserId;

        public AddBorrowView()
        {
            InitializeComponent();
        }
        string From;
        public AddBorrowView(string from)
        {
            InitializeComponent();
            From = from;
           
        }
        async void GetdatagridItems()
        {
            BorrowNoteDatabase a = new BorrowNoteDatabase();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }

        async void GetBorrowInvoice()
        {
            BorrowInvoiceDatabase borrowInvoiceDatabase = new BorrowInvoiceDatabase();
            AccountDatagrid.ItemsSource = await borrowInvoiceDatabase.GetAccountsAsync();
        }
        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            #region get limits
            SettingDatabase settingDatabase = new SettingDatabase();
            List<SettingModel> settingModels = await settingDatabase.GetAccountsAsync();
            foreach (var item in settingModels)
            {
                BooksLimit = item.BooksLimit;
                ReturnLimit = item.ReturnLimit;
            }
            #endregion
            if (From == "fromBorrowInvoice")
            {
                try
                {
                    #region changing controls property
                    btnDeleteInvoice.Visibility = Visibility.Visible;
                    lblTitle.Content = "Library Invoice";
                    btnReturn.Visibility = Visibility.Visible;
                    btnUpdate.Visibility = Visibility.Visible;
                    invoice.Content = "Update Invoice";
                    lblInvoiceId.Content = "";
                    txtDate.IsEnabled=true;
                    #endregion
                    #region datagrid design
                    AccountDatagrid.Columns.Clear();
                    DataGridTextColumn columnBorrowId = new DataGridTextColumn() { Visibility = Visibility.Collapsed, Header = "BorrowId", Binding = new Binding("BorrowId"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnBookId = new DataGridTextColumn() { Visibility = Visibility.Collapsed, Header = "BookId", Binding = new Binding("BookId"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnBorrowInvoiceId = new DataGridTextColumn() { Header = "BorrowInvoiceId", Binding = new Binding("BorrowInvoiceId"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnPersonId = new DataGridTextColumn() { Visibility = Visibility.Collapsed, Header = "PersonId", Binding = new Binding("PersonId"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnAccountId = new DataGridTextColumn() { Visibility = Visibility.Collapsed, Header = "AccountId", Binding = new Binding("AccountId"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnBookName = new DataGridTextColumn() { Header = "Book-name", Binding = new Binding("BookName"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnQuantity = new DataGridTextColumn() { Header = "Quantity", Binding = new Binding("Quantity"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnFullName = new DataGridTextColumn() { Header = "Fullname", Binding = new Binding("FullName"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnBorrowDate = new DataGridTextColumn() { Header = "Borrow-Date", Binding = new Binding("Date"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnReturnDate = new DataGridTextColumn() { Header = "Return-Date", Binding = new Binding("ReturenDate"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnEmployee = new DataGridTextColumn() { Header = "Employee", Binding = new Binding("Employee"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };
                    DataGridTextColumn columnIsReturned = new DataGridTextColumn() { Header = "Is-returned", Binding = new Binding("IsReturned"), MinWidth = 140, Width = new DataGridLength(1, DataGridLengthUnitType.Star) };

                    AccountDatagrid.Columns.Add(columnBorrowId);
                    AccountDatagrid.Columns.Add(columnBookId);
                    AccountDatagrid.Columns.Add(columnBorrowInvoiceId);
                    AccountDatagrid.Columns.Add(columnPersonId);
                    AccountDatagrid.Columns.Add(columnAccountId);
                    AccountDatagrid.Columns.Add(columnBookName);
                    AccountDatagrid.Columns.Add(columnQuantity);
                    AccountDatagrid.Columns.Add(columnFullName);
                    AccountDatagrid.Columns.Add(columnBorrowDate);
                    AccountDatagrid.Columns.Add(columnReturnDate);
                    AccountDatagrid.Columns.Add(columnEmployee);
                    AccountDatagrid.Columns.Add(columnIsReturned);
                    #endregion
                    GetBorrowInvoice();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                return;
            }
           
            GetdatagridItems();
            txtDate.SelectedDate = DateTime.Now;
            txtReturnDate.SelectedDate = DateTime.Now.AddDays(ReturnLimit);
            BorrowNoteDatabase borrowNoteDatabase= new BorrowNoteDatabase();
            BorrowInvoiceId = 0;
            var lid = await borrowNoteDatabase.GetScalerValueAsync("select isnull(max(BorrowInvoiceId),0) from BorrowInvoice");
            BorrowInvoiceId = int.Parse(lid) + 1;
            lblInvoiceId.Content = BorrowInvoiceId.ToString();
        }

        private void btnChooseBook_Click(object sender, RoutedEventArgs e)
        {
            BooksView booksView=new BooksView("fromAddBorrow");
            booksView.ShowDialog();
            txtBookName.Text = BookName;

        }

        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                BorrowNoteDatabase borrowNoteDatabase = new BorrowNoteDatabase();
                if (From == "fromBorrowInvoice")
                {
                    if (lblInvoiceId.Content==""||lblInvoiceId.Content==null)
                    {
                        throw new Exception("please select an invoice to be inserted");
                    }
                    if (txtBookName.Text == "" || txtBookName.Text == null || BookId == 0 || BookId == null)
                    {
                        txtBookName.Focus();
                        throw new System.Exception("Book must be selected");
                    }
                    if (txtQuantity.Text == "" || txtQuantity.Text == null)
                    {
                        txtQuantity.Focus();
                        throw new System.Exception("Quantity must be inserted");
                    }
                    if (BookId == 0 || BookId == null)
                    {
                        throw new Exception("an error on choosing book occured, try again");
                    }

                    #region valiate if can have more books to be inserted
                    var countBook = int.Parse(await borrowNoteDatabase.GetScalerValueAsync($"select isnull(sum(Quantity),0) from Borrow where BorrowInvoiceId={BorrowInvoiceId} and IsReturned=0"));
                    if (countBook >= BooksLimit)
                    {
                        throw new Exception("this invoice already have fullfilled books limit");
                    }
                    int parseQuantity = int.Parse(txtQuantity.Text);
                    if (parseQuantity>BooksLimit || (parseQuantity+countBook)>BooksLimit)
                    {
                        throw new Exception("you entered Books more than an invoice can have");
                    }
                    #endregion
                    #region get last borrow id
                    var lidd = await borrowNoteDatabase.GetScalerValueAsync("select isnull(max(BorrowId),0) from Borrow");
                    lastid = int.Parse(lidd) + 1;
                    #endregion

                    #region insert into borrow
                    await borrowNoteDatabase.ExcuteAsync($"insert into Borrow values({lastid},{BookId},{BorrowInvoiceId},{parseQuantity},0)");
                    borrowClear();
                    #endregion
                    return;
                }
                #region AddToBorrow

                if (txtBookName.Text == "" || txtBookName.Text == null || BookId == 0 || BookId == null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book must be selected");
                }
                if (txtQuantity.Text == "" || txtQuantity.Text == null)
                {
                    txtQuantity.Focus();
                    throw new System.Exception("Quantity must be inserted");
                }
                if (BookId == 0 || BookId == null)
                {
                    throw new Exception("an error on choosing book occured, try again");
                }

                #region Validate if books exist
                var countLibraryBook = int.Parse(await borrowNoteDatabase.GetScalerValueAsync($"select isnull(sum(Quantity),0) from Library where BookId={BookId}"));
                var countBorrowBook = int.Parse(await borrowNoteDatabase.GetScalerValueAsync($"select isnull(sum(Quantity),0) from Borrow where IsReturned=0 and BookId={BookId}"));
                var beforeResult = countLibraryBook - countBorrowBook;
                var result = beforeResult - int.Parse(txtQuantity.Text);
                if (result < 0)
                {
                    throw new Exception($"you inserted books more than existing in Library \nthere is {beforeResult} books in Library\n you inserted {txtQuantity.Text} books");
                }
                #endregion
                #region validate books limit
                var getBooksCount = int.Parse(await borrowNoteDatabase.GetScalerValueAsync("select isnull(sum(quantity),0) from BorrowNote"));
                if (getBooksCount + int.Parse(txtQuantity.Text) > BooksLimit)
                {
                    throw new Exception($"you can't insert books more than {BooksLimit}");
                }
                if (int.Parse(txtQuantity.Text) > BooksLimit)
                {
                    throw new Exception("No one can take more than three books");
                }
                #endregion

                var lid = await borrowNoteDatabase.GetScalerValueAsync("select isnull(max(BorrowId),0) from BorrowNote");
                lastid = int.Parse(lid) + 1;
                BorrowNote libraryNote = new BorrowNote();
                libraryNote.BorrowId = lastid;
                libraryNote.Quantity = int.Parse(txtQuantity.Text);
                libraryNote.BookId = BookId;
                await borrowNoteDatabase.ExcuteAsyncWithParameters("insert into BorrowNote values(@id,@bookid,@quant)",
                     new Dictionary<string, object> {
                        {"@id",libraryNote.BorrowId },
                        {"@bookid",libraryNote.BookId },
                        {"@quant",libraryNote.Quantity },
                     });
                clear(); 
                #endregion
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        void borrowClear()
        {
            GetBorrowInvoice();
            btnChooseBook.Focus();
            txtBookName.Text = "";
            BookName = "";
            BookId = 0;
            txtQuantity.Text = "";
            lblInvoiceId.Content = "";
        }
        void clear()
        {
            GetdatagridItems();
            btnChooseBook.Focus();
            txtBookName.Text = "";
            BookName = "";
            BookId = 0;
            txtQuantity.Text = "";
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                
                MessageBoxResult result = MessageBox.Show("Are you Sure to delete this", "", MessageBoxButton.YesNo, MessageBoxImage.Question);
                SettingDatabase settingDatabase = new SettingDatabase();
                if (result == MessageBoxResult.Yes)
                {
                    if (From == "fromBorrowInvoice")
                    {
                        if (UpdateId == 0 || UpdateId == null)
                        {
                            throw new Exception("please choose what to delete");
                        }
                        await settingDatabase.ExcuteAsyncWithParameters("delete from Borrow where BorrowId=@id",
                        new Dictionary<string, object> {{"@id",UpdateId }});
                        borrowClear();
                        UpdateId = 0;
                        return;
                    }
                    if (UpdateId == 0 || UpdateId == null)
                    {
                        throw new Exception("please choose what to delete");
                    }
                    await settingDatabase.ExcuteAsyncWithParameters("delete from BorrowNote where BorrowId=@id",
                    new Dictionary<string, object> {{"@id",UpdateId }});
                    clear();
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            if (From == "fromBorrowInvoice")
            {
                borrowClear();
                return;
            }
            clear();
        }

        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
                Regex regex = new Regex("[^0-9]+");
                e.Handled = regex.IsMatch(e.Text);
        }

        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                BorrowNoteDatabase borrowNoteDatabase = new BorrowNoteDatabase();
                if (UpdateId==0)
                {
                    throw new Exception("please choose to be updated");
                }
                if (lblInvoiceId.Content == "" || lblInvoiceId.Content == null)
                {
                    throw new Exception("please select an invoice to be inserted");
                }
                if (txtBookName.Text == "" || txtBookName.Text == null || BookId == 0 || BookId == null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book must be selected");
                }
                if (txtQuantity.Text == "" || txtQuantity.Text == null)
                {
                    txtQuantity.Focus();
                    throw new System.Exception("Quantity must be inserted");
                }
                if (BookId == 0 || BookId == null)
                {
                    throw new Exception("an error on choosing book occured, try again");
                }

                #region valiate if can have more books to be inserted
                var countBook = int.Parse(await borrowNoteDatabase.GetScalerValueAsync($"select isnull(sum(Quantity),0) from Borrow where BorrowInvoiceId={BorrowInvoiceId} and IsReturned=0"));
                var countUpdateBook= int.Parse(await borrowNoteDatabase.GetScalerValueAsync($"select isnull(sum(Quantity),0) from Borrow where BorrowId={UpdateId} and IsReturned=0"));
                int parseQuantity = int.Parse(txtQuantity.Text);
                if (parseQuantity > BooksLimit || ((parseQuantity + countBook)-countUpdateBook) > BooksLimit)
                {
                    throw new Exception("you entered Books more than an invoice can have");
                }
                #endregion

                #region insert into borrow
                await borrowNoteDatabase.ExcuteAsync($"update Borrow set BookId={BookId}, Quantity={parseQuantity} where BorrowId={UpdateId}");
                borrowClear();
                UpdateId = 0;
                #endregion
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private async void btnReturn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (UpdateId==0)
                {
                    throw new Exception("please choose what to return");
                }
                BorrowNoteDatabase borrowNoteDatabase = new BorrowNoteDatabase();
                if (btnReturn.Content == "Return")
                {
                    await borrowNoteDatabase.ExcuteAsync($"update Borrow set IsReturned=1 where BorrowId={UpdateId}");
                    borrowClear();
                    UpdateId = 0;
                }
                else
                {
                    await borrowNoteDatabase.ExcuteAsync($"update Borrow set IsReturned=0 where BorrowId={UpdateId}");
                    borrowClear();
                    UpdateId = 0;
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                lblSearchs.Visibility=Visibility.Visible;
                BorrowInvoice borrowInvoice = new BorrowInvoice();
                #region Validation
                if (txtSearch.Text==""||txtSearch.Text==null)
                {
                    borrowInvoice.FullName = null;
                    borrowInvoice.BookId = null;
                    borrowInvoice.BorrowInvoiceId = null;
                }
                else
                {
                    borrowInvoice.FullName = txtSearch.Text;
                    borrowInvoice.BookName = txtSearch.Text;
                    if (int.TryParse(txtSearch.Text, out int result))
                    {
                        borrowInvoice.BorrowInvoiceId = result;
                    }
                    else
                    {
                        borrowInvoice.BorrowInvoiceId = null;
                    }
                }
                
                #endregion
                BorrowInvoiceDatabase borrowInvoiceDatabase = new BorrowInvoiceDatabase();
                AccountDatagrid.ItemsSource = await borrowInvoiceDatabase.GetFilteredAccountsAsync(new Dictionary<string, object>() {
                    {"@invoiceid",borrowInvoice.BorrowInvoiceId},
                    {"@full",borrowInvoice.FullName },
                    {"@book",borrowInvoice.BookName },
                });

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnChoosePerson_Click_1(object sender, RoutedEventArgs e)
        {
            PersonView personView = new PersonView("fromBorrowNote");
            personView.ShowDialog();
            txtPerson.Text = PersonName;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private async void btnDeleteInvoice_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                MessageBoxResult result = MessageBox.Show("Are you Sure to delete this", "", MessageBoxButton.YesNo, MessageBoxImage.Question);
                BorrowInvoiceDatabase borrowInvoiceDatabase= new BorrowInvoiceDatabase();
                if (result == MessageBoxResult.Yes)
                {
                    await borrowInvoiceDatabase.ExcuteAsync($"delete from Borrow where BorrowInvoiceId={lblInvoiceId.Content}");
                    await borrowInvoiceDatabase.ExcuteAsync($"delete from BorrowInvoice where BorrowInvoiceId={lblInvoiceId.Content}");
                    MessageBox.Show("deleted");
                    borrowClear();
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            if (From== "fromBorrowInvoice")
            {
                var select = (BorrowInvoice)AccountDatagrid.SelectedItem;
                if (select != null)
                {
                    UpdateId = select.BorrowId;
                    txtBookName.Text = select.BookName;
                    BookId = select.BookId;
                    txtQuantity.Text = select.Quantity.ToString();
                    lblInvoiceId.Content = select.BorrowInvoiceId;
                    txtDate.Text = select.Date.ToString();
                    txtReturnDate.Text = select.ReturenDate.ToString();
                    txtPerson.Text = select.FullName;
                    PersonId=select.PersonId;
                    BorrowInvoiceId=select.BorrowInvoiceId;
                    if (select.IsReturned==false)
                    {
                        btnReturn.Background = Brushes.Red;
                        btnReturn.Content = "Return";
                    }
                    else
                    {
                        btnReturn.Background = Brushes.Green;
                        btnReturn.Content = "Returned";
                    }

                }
                return;
            }
            var selected = (BorrowNote)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                UpdateId = selected.BorrowId;
                txtBookName.Text = selected.BookName;
                BookId = selected.BookId;
                txtQuantity.Text = selected.Quantity.ToString();
            }
        }

        private async void invoice_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (From == "fromBorrowInvoice")
                {
                    #region validation for update invoice
                    if (txtPerson.Text == "" || txtPerson.Text == null || PersonId == null || PersonId == 0)
                    {
                        throw new Exception("please select the person");
                    }
                    if (txtDate.Text == null || txtDate.Text == "")
                    {
                        throw new Exception("Date must be selected");
                    }
                    if (lblInvoiceId.Content == null || lblInvoiceId.Content == "")
                    {
                        throw new Exception("Invoice must be selected");
                    } 
                    #endregion
                    BorrowInvoiceDatabase borrowInvoiceDatabase = new BorrowInvoiceDatabase();
                    var returnDate =  DateTime.Parse(txtDate.Text).AddDays(ReturnLimit);
                    await borrowInvoiceDatabase.ExcuteAsync
                        ($"update BorrowInvoice set PersonId={PersonId}, Date='{txtDate.Text}', ReturenDate='{returnDate}' where BorrowInvoiceId={lblInvoiceId.Content}");
                    borrowClear();
                    return;
                }

                if (txtPerson.Text == "" || txtDate.Text == null || PersistId==0 ||PersistId==null)
                {
                    throw new Exception("please select the person");
                }
                var datagridCount = AccountDatagrid.Items.Count;
                if (datagridCount <= 0)
                {
                    throw new Exception("please insert records to the list");
                }
                BorrowNoteDatabase borrowNoteDatabase= new BorrowNoteDatabase();
                
                await borrowNoteDatabase.ExcuteAsync($"insert into BorrowInvoice values({int.Parse(lblInvoiceId.Content.ToString().Trim())},{PersonId},'{txtDate.SelectedDate}','{txtReturnDate.SelectedDate}',{AccountId})");
                List<BorrowNote> borrowNotes= await borrowNoteDatabase.GetAccountsAsync();
                BorrowInvoicePrint invoicePrint = new BorrowInvoicePrint(lblInvoiceId.Content.ToString(),txtDate.Text,txtReturnDate.Text,AccountId.ToString(),txtPerson.Text);
                invoicePrint.ShowDialog();
                foreach (var item in borrowNotes)
                {
                    var id = await borrowNoteDatabase.GetScalerValueAsync("select isnull(max(BorrowId),0)+1 from Borrow");
                    await borrowNoteDatabase.ExcuteAsync($@"insert into Borrow 
                    values({id},{item.BookId},{int.Parse(lblInvoiceId.Content.ToString().Trim())},{item.Quantity},0)");
                }
                var borrowCount = await borrowNoteDatabase.GetScalerValueAsync($"select count(BorrowInvoiceId) from Borrow where BorrowInvoiceId={lblInvoiceId.Content}");
                if (int.Parse(borrowCount) <= 0)
                {
                    await borrowNoteDatabase.ExcuteAsync($"delete from BorrowInvoice where BorrowInvoiceId={lblInvoiceId.Content}");
                    await borrowNoteDatabase.ExcuteAsync($"delete from Borrow where BorrowInvoiceId={lblInvoiceId.Content}");
                    throw new Exception("please try again");
                }
                else
                {
                    await borrowNoteDatabase.ExcuteAsync($"delete from BorrowNote");
                    MessageBox.Show("successfull");
                    lblInvoiceId.Content = await borrowNoteDatabase.GetScalerValueAsync($"select isnull(max(BorrowInvoiceId),0)+1 from BorrowInvoice");
                    clear();
                    txtPerson.Text = "";
                    PersonId = 0;
                    PersonName = "";
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
