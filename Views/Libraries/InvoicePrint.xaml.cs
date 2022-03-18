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

namespace LibraryManagementApplication.Views.Libraries
{
    /// <summary>
    /// Interaction logic for InvoicePrint.xaml
    /// </summary>
    public partial class InvoicePrint : Window
    {
        public InvoicePrint()
        {
            InitializeComponent();
        }

        int AccountId;
        string InvoiceId;
        string Total;
        public InvoicePrint(string invoiceId,int accountId,DateTime? date)
        {
            InitializeComponent();
            InvoiceId = invoiceId;
            AccountId = accountId;

            lblInvoiceId.Content = invoiceId.ToString();
            lblAccountId.Content = accountId.ToString();
            lblDate.Content = date.ToString();


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

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            LibraryNoteViewModel libraryNoteViewModel = new LibraryNoteViewModel();
            Total = await libraryNoteViewModel.GetScalerValueAsync("select sum(BookPrice*Quantity) from LibraryNote");
            lblTotal.Content = Total;

        }
        async void GetdatagridItems()
        {
            LibraryNoteViewModel a = new LibraryNoteViewModel();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }

        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            PrintDialog myPrintDialog = new PrintDialog();
            if (myPrintDialog.ShowDialog() == true)
            {
                myPrintDialog.PrintVisual(stackPrint, "print all");
            }
        }
    }
}
