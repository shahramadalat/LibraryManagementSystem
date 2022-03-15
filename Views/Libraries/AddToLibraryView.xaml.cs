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
using System.Text.RegularExpressions;
using LibraryManagementApplication.ViewModels;
using LibraryManagementApplication.Views.Books;

namespace LibraryManagementApplication.Views.Libraries
{
    /// <summary>
    /// Interaction logic for AddToLibraryView.xaml
    /// </summary>
    public partial class AddToLibraryView : Window
    {
        public static int BookId=0;
        public static string BookName="";
        public AddToLibraryView()
        {
            InitializeComponent();
        }
        async void GetdatagridItems()
        {
            LibraryNoteViewModel a = new LibraryNoteViewModel();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
                Regex regex = new Regex("[^0-9]+");
                e.Handled = regex.IsMatch(e.Text);
        }

        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            txtDate.DisplayDate = DateTime.Now;
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

        private void btnChooseBook_Click(object sender, RoutedEventArgs e)
        {
            BooksView booksView = new BooksView("fromAddLibraryNote");
            booksView.ShowDialog();
            txtBookName.Text = BookName;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
