using LibraryManagementApplication.ViewModels;
using System.Windows;
using System.Windows.Controls;

namespace LibraryManagementApplication.Views.Books
{
    /// <summary>
    /// Interaction logic for BooksView.xaml
    /// </summary>
    public partial class BooksView : Window
    {
        public int LanguageId, CategoryId;
        public string Language,Category;
        public BooksView()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
        }
        async void GetdatagridItems()
        {
            BookViewModel a = new BookViewModel();
            AccountDatagrid.ItemsSource = await a.GetItemsAsync();
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

        private void btnLanguage_Click(object sender, RoutedEventArgs e)
        {
            LanguageView languageView = new LanguageView();
            languageView.ShowDialog();
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
