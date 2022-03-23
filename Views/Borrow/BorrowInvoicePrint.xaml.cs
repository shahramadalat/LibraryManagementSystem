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

namespace LibraryManagementApplication.Views.Borrow
{
    /// <summary>
    /// Interaction logic for BorrowInvoicePrint.xaml
    /// </summary>
    public partial class BorrowInvoicePrint : Window
    {
        
        public BorrowInvoicePrint(string invoiceid, string borrowdate,string returndate, string account,string person)
        {
            InitializeComponent();
            lblAccountId.Content = account;
            lblPerson.Content = person;
            lblDate.Content = borrowdate;
            lblInvoiceId.Content = invoiceid;
            lblReturnDate.Content = returndate;
        }
        async void GetdatagridItems()
        {
            BorrowNoteDatabase a = new BorrowNoteDatabase();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
        }

        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            PrintDialog myPrintDialog = new PrintDialog();
            if (myPrintDialog.ShowDialog() == true)
            {
                myPrintDialog.PrintVisual(stackPrint, "print all");
            }
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBoxResult mr = MessageBox.Show("Are you sure to close the window? ", "quesion", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (mr.Equals(MessageBoxResult.Yes))
                {
                    this.Close();
                }

            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
