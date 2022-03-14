﻿using LibraryManagementApplication.Views;
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