using LibraryManagementApplication.Models;
using LibraryManagementApplication.Views;
using LibraryManagementApplication.Views.Books;
using LibraryManagementApplication.Views.Borrow;
using LibraryManagementApplication.Views.Libraries;
using LibraryManagementApplication.Views.Setting;
using System.Windows;

namespace LibraryManagementApplication
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class Home : Window
    {

        public static int UserId;
        string userPermission,username,fullname;
        public Home()
        {

        }
        //yakam sht ka ish dakat
        public Home(int userId, string fullname, string username, string userPermission)
        {
            InitializeComponent();
            UserId = userId;
            this.fullname = fullname;
            this.username = username;
            this.userPermission = userPermission;

            lblFullname.Content = fullname;
            lblPermission.Content = userPermission;
            lblUserID.Content = userId;
            if (userPermission == "user")
            {
                // shardnawai am buttonana
                btnAccount.Visibility = Visibility.Collapsed;
                btnBorrow.Visibility = Visibility.Collapsed;
                btnLibrary.Visibility = Visibility.Collapsed;
                btnPerson.Visibility = Visibility.Collapsed;
                btnSetting.Visibility = Visibility.Collapsed;

            }
            else if (userPermission == "employee")
            {
                // am dwanaman le shardotawa
                btnAccount.Visibility = Visibility.Collapsed;
                btnSetting.Visibility = Visibility.Collapsed;
            }

        }

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
            
            if (userPermission=="user")
            {
                BooksView booksViews = new BooksView("user");
                booksViews.ShowDialog();
            }
            BooksView booksView = new BooksView();
            booksView.ShowDialog();
        }

        private void btnLibrary_Click(object sender, RoutedEventArgs e)
        {
            MainLibraryView lb = new MainLibraryView();
            lb.ShowDialog();
                
        }

        private void btnPerson_Click(object sender, RoutedEventArgs e)
        {
            PersonView personView= new PersonView();
            personView.ShowDialog();
        }

        private void btnBorrow_Click(object sender, RoutedEventArgs e)
        {
            BorrowMainView borrowMainView=new BorrowMainView();
            borrowMainView.ShowDialog();
        }

        private void btnSetting_Click(object sender, RoutedEventArgs e)
        {
            SettingView settingView=new SettingView();
            settingView.ShowDialog();
        }

      
    }
}
