using LibraryManagementApplication.Views;
using LibraryManagementApplication.Views.Books;
using LibraryManagementApplication.Views.Libraries;
using System.Windows;

namespace LibraryManagementApplication
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class Home : Window
    {
        int userId;
        string userPermission,username,fullname;

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void btnMinimized_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void btnAccount_Click(object sender, RoutedEventArgs e)
        {
            AccountView ac = new AccountView();
            ac.ShowDialog();

        }

        private void btnBooks_Click(object sender, RoutedEventArgs e)
        {
            BooksView booksView = new BooksView();
            booksView.ShowDialog();
        }

        private void btnLibrary_Click(object sender, RoutedEventArgs e)
        {
            MainLibraryView lb = new MainLibraryView();
            lb.ShowDialog();
                
        }

        public Home()
        {

        }
        public Home(int userId, string fullname,string username,string userPermission)
        {
            InitializeComponent();
            this.userId = userId;
            this.fullname = fullname;
            this.username = username;
            this.userPermission = userPermission;

            lblFullname.Content = fullname;
            lblPermission.Content = userPermission;
            lblUserID.Content = userId;

        }
    }
}
