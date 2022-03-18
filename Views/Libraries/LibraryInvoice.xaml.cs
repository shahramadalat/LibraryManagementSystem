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

namespace LibraryManagementApplication.Views.Libraries
{
    /// <summary>
    /// Interaction logic for LibraryInvoice.xaml
    /// </summary>
    public partial class LibraryInvoice : Window
    {
        int lastid = 0;
        int UpdateId = 0;
        int LibraryInvoiceId = 0;
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
        void clear()
        {
            btnChooseBook.Focus();
            txtBookName.Text = "";
            BookName = "";
            BookId = 0;
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtDate.Text = "";
        }
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnChooseBook_Click(object sender, RoutedEventArgs e)
        {

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

        }
    }
}
