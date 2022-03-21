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
        public static int BookId,PersonId=0;
        public static string BookName,PersonName="";
        int BorrowInvoiceId, lastid = 0;
        

        public AddBorrowView()
        {
            InitializeComponent();
        }
        async void GetdatagridItems()
        {
            BorrowNoteDatabase a = new BorrowNoteDatabase();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            txtDate.SelectedDate = DateTime.Now;
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
                if (BookId==0||BookId==null)
                {
                    throw new Exception("an error on choosing book occured, try again");
                }
                BorrowNoteDatabase borrowNoteDatabase = new BorrowNoteDatabase();
                

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
                AccountDatagrid.ItemsSource = await borrowNoteDatabase.GetAccountsAsync();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        void clear()
        {
            btnChooseBook.Focus();
            txtBookName.Text = "";
            BookName = "";
            BookId = 0;
            txtQuantity.Text = "";
        }
        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnChoosePerson_Click(object sender, RoutedEventArgs e)
        {

        }

        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
                Regex regex = new Regex("[^0-9]+");
                e.Handled = regex.IsMatch(e.Text);
        }

        private void btnBorrowClear_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {

        }

        private void invoice_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
