using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Text.RegularExpressions;
using LibraryManagementApplication.ViewModels;
using LibraryManagementApplication.Views.Books;
using System.Collections.Generic;
using LibraryManagementApplication.Models;

namespace LibraryManagementApplication.Views.Libraries
{
    /// <summary>
    /// Interaction logic for AddToLibraryView.xaml
    /// </summary>
    

    public partial class AddToLibraryView : Window
    {
        int lastid=0;
        int UpdateId = 0;
        int LibraryInvoiceId = 0;
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

        void clear()
        {
            btnChooseBook.Focus();
            txtBookName.Text = "";
            BookName = "";
            BookId = 0;
            txtPrice.Text = "";
            txtQuantity.Text = "";
        }
        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtBookName.Text == "" || txtBookName.Text == null || BookId==0||BookId==null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book must be selected");
                }
                if (txtPrice.Text == "" || txtPrice.Text == null)
                {
                    txtPrice.Focus();
                    throw new System.Exception("Book price must be inserted");
                }
                if (txtQuantity.Text == "" || txtQuantity.Text == null)
                {
                    txtQuantity.Focus();
                    throw new System.Exception("Quantity must be inserted");
                }
                LibraryNoteViewModel libraryNoteViewModel = new LibraryNoteViewModel();
                var lid = await libraryNoteViewModel.GetScalerValueAsync("select isnull(max(LibraryNoteId),0) from LibraryNote");
                lastid = int.Parse(lid) + 1;
                LibraryNote libraryNote=new LibraryNote();
                libraryNote.LibraryNoteId = lastid;
                libraryNote.Quantity = int.Parse(txtQuantity.Text);
                libraryNote.BookPrice = int.Parse(txtPrice.Text);
                libraryNote.BookId = BookId;
                await libraryNoteViewModel.ExcuteAsyncWithParameters("insert into LibraryNote values(@id,@bookid,@quant,@bookprice)",
                     new Dictionary<string, object> {
                        {"@id",libraryNote.LibraryNoteId },
                        {"@bookid",libraryNote.BookId },
                        {"@quant",libraryNote.Quantity },
                        {"@bookprice",libraryNote.BookPrice},
                     });
                clear();
                AccountDatagrid.ItemsSource = await libraryNoteViewModel.GetAccountsAsync();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            txtDate.DisplayDate = DateTime.Now;
            LibraryNoteViewModel libraryNoteViewModel = new LibraryNoteViewModel();
            var lid = await libraryNoteViewModel.GetScalerValueAsync("select isnull(max(LibraryInvoiceId),0) from LibraryInvoice");
            LibraryInvoiceId = int.Parse(lid) + 1;
            lblInvoiceId.Content = LibraryInvoiceId.ToString();
        }

        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtBookName.Text == "" || txtBookName.Text == null || BookId == 0 || BookId == null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book must be selected");
                }
                if (txtPrice.Text == "" || txtPrice.Text == null)
                {
                    txtPrice.Focus();
                    throw new System.Exception("Book price must be inserted");
                }
                if (txtQuantity.Text == "" || txtQuantity.Text == null)
                {
                    txtQuantity.Focus();
                    throw new System.Exception("Quantity must be inserted");
                }
                if (UpdateId==0||UpdateId==null)
                {
                    throw new Exception("an error occured please try again");
                }
                LibraryNote libraryNote= new LibraryNote();
                LibraryNoteViewModel libraryNoteViewModel= new LibraryNoteViewModel();
                int count = int.Parse(await libraryNoteViewModel.GetScalerValueAsync($"select count(LibraryNoteId) from LibraryNote where LibraryNoteId = {UpdateId}"));
                if (count == 0 || count < 1 || count > 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                }
                libraryNote.LibraryNoteId = UpdateId;
                libraryNote.Quantity = int.Parse(txtQuantity.Text);
                libraryNote.BookPrice = int.Parse(txtPrice.Text);
                libraryNote.BookId = BookId;
                await libraryNoteViewModel.ExcuteAsyncWithParameters(@"update LibraryNote set BookId=@bookid, quantity = @quant, BookPrice=@price where LibraryNoteId=@id",
                     new Dictionary<string, object> {
                        {"@id",libraryNote.LibraryNoteId },
                        {"@bookid",libraryNote.BookId },
                        {"@quant",libraryNote.Quantity },
                        {"@price",libraryNote.BookPrice },
                     });
                UpdateId = 0;
                AccountDatagrid.ItemsSource = await libraryNoteViewModel.GetAccountsAsync();
                MessageBox.Show("updated successfully.");
                clear();

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LibraryNoteViewModel libraryNoteViewModel= new LibraryNoteViewModel();
                await libraryNoteViewModel.ExcuteAsyncWithParameters("delete from LibraryNote where LibraryNoteId=@id",
                    new Dictionary<string, object> {
                    {"@id",UpdateId }}
                    );

            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            GetdatagridItems();
            clear();
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            clear();
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
            var selected = (LibraryNote)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                UpdateId = selected.LibraryNoteId;
                txtBookName.Text = selected.BookName;
                BookId = selected.BookId;
                txtQuantity.Text = selected.Quantity.ToString();
                txtPrice.Text = selected.BookPrice.ToString();
            }
        }
    }
}
