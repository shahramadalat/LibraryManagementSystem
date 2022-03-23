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
    /// Interaction logic for BorrowMainView.xaml
    /// </summary>
    public partial class BorrowMainView : Window
    {
        public BorrowMainView()
        {
            InitializeComponent();
        }

        private void btnAddToBorrow_Click(object sender, RoutedEventArgs e)
        {
            AddBorrowView addBorrowView = new AddBorrowView();
            addBorrowView.ShowDialog();
        }

        private void btnBorrowInvoice_Click(object sender, RoutedEventArgs e)
        {
            AddBorrowView addBorrowView = new AddBorrowView("fromBorrowInvoice");
            addBorrowView.ShowDialog();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }
    }
}
