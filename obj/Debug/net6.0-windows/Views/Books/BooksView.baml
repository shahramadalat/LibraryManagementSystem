   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullc6clr-namespace:LibraryManagementApplication.Views.Books(LibraryManagementApplication.Views.Books  5   	   8    2LibraryManagementApplication.Views.Books.BooksView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Hlocal6clr-namespace:LibraryManagementApplication.Views.Books     5   	   -   5          � Title$  	BooksView��5   	   $	��450��6   $	��800��6(    � WindowStartupLocation$ CenterScreen=�5	   
    � WindowStyle$
 None=�5
   
    � WindowState$ 	Maximized=�5   
    � 	Resources 5       �� 
TargetType �� Property �� Value��%  '��       '�� s     '��     �� 5   
   " ��6   .�5      ��  � ��$ Right=�64   �� 5       � ��$ Center=�62   5      �� 5   
   " ��6   .�5      ��  � ��$
 auto��6&   �� 5       � ��$	 150��6)   67   �� 5       � ��$ 30��6'   5      �� 5   
   " ��6   .�5      ��  � �� �#0066ff6+   �� 5       � ��
 �����6+   �� 5       � ��$ 60��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 10,0,0,0q�6'   5      5      .��5      �  � ColumnDefinitions 5    
   �� 5!      $��9* �6   �� 5"      $
��auto �6   	 � RowDefinitions	 5$   
   �� 5%      �� 5&      $	��10* �6   �� 5'      .+�5,   
   �� $��29��6   $��0��6!   $��0��6.   
 �� Orientation$
 
Horizontal=�6>   $	��Top=�6W   ���#0066ff.+�5-      �� $��15(�6   
�������.��65   Books6<   5.      �� 50   
   $��0��6   ���#0066ff$��1��67   $
 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�52      �� -   5         ��Name$ btnExit��52      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   53      � 56   
   $��1��6   $��2��6   	 57      �� 58      $��* �6    �� 59      $��2* �6    .+�5;      � $��0��6    5<      �� 5=      �� 5>      �� 5?      �� 5@      �� 5A      	 5C      �� 5D      �� 5E      �� 5F      �� 5G      .+�5J      �� .��6   	Book name6$   �� 5K      -   5         ��Name$ txtBookName��5K   '   $��0��6   $��1��6<   6O   �� 5N      $��2��6   .��6(   Author60   �� 5O      -   5        $ 	txtAuthor��5O   '   $��1��6   $��3��6:   6M   �� 5R      $��1��6   $��0��6%   .��65   	Publisher6@   �� 5S      -   5        $ txtPublisher��5S   '   $��2��6   $��1��6=   $��1��6J   6]   �� 5V      -   5         ��Name$ lblPublishDate��5V      $��1��60   $��2��6=   $��2��6M   $
��Left=�6a   $��89,0,0,0q�6|   .��6�   PublishDate6�   (  "System.Windows.Controls.DatePicker  5W      -   5          Name$ txtPublishDate��5W   *   $��3��6   $��1��6B   $��3��6O   $��30��6_   6m   �� 5Z      -   5        $ lblLanguage��5Z      $��2��6-   $��0��6:   .��6J   
Language6T   �� 5[      -	   5        $ txtLanguage��5[   E   ${�False��6   $��4��6,   $��30��69   $��2��6Z   $��1��6g   6y   �� 5\      -
   5        $ btnLanguage��5\   3   $��2��6H   $��2��6X   $��90��6e   $��30��6p   .��6|   Go to Language6�   �� 5^      -   5        $ lblCategorey��5^      $��3��6.   $��0��6<   .��6L   
Category6V   �� 5_      -   5        $ txtCategory��5_   E   ${�False��6   $��30��6,   $��5��68   $��3��6Z   $��1��6g   6y   �� 5`      -   5        $ btnCategorey��5`   4   $��2��6J   $��3��6Z   $��90��6g   $��30��6r   .��6~   Go to Category6�   �� 5b      $
 Vertical=�6   $��Center=�64   $��Center=�6O   $��2��6l   $��3��6y   $��2��6�   .+�5c      �� $
 
Horizontal=�6!   $��Center=�6:   $��Center=�6W   .+�5d      �� -   5        $ 	btnInsert��5d   F   $��6��69   
��� � �.��6l   Insert6t   �� 5e      -   5        $ 	btnUpdate��5e   F   $��7��69   .��6Y   Update6a   �� 5f      -   5        $ 	btnDelete��5f   F   $��8��69   
���  ��.��6n   Delete6v   �� 5g      -   5        $ 	btnSearch��5g   F   $��9��69   
�����_�.��6p   Search6x   �� 5h      -   5        $ btnClear��5h   F   $��10��68   
�����_�.��6o   Clear6v   5i      �� 5j      $��Center=�6!   $��Center=�6>   .+�5k      �� -   5        $ 	lblSearch��5k       $y�	Collapsed=�63   .��6J   FDsearch based on Book name, Author, Publisher, Language and Categorey6�   5l      5m      5n      &   System.Windows.Controls.DataGrid  5o      -   5          Name$ AccountDatagrid��5q      $��1��5p      ��5r      �� *
accounts+   Columns 5v      0  *System.Windows.Controls.DataGridTextColumn  5w      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6[      MinWidth$	 150Q�6e      Header$ 	AccountId��6t   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *BookId+6�     5x      $ 	Collapsed=�6)   $ * 6_   $	 150Q�6i   $ 
LanguageId��6x    6@   �� *
LanguageId+6�     5y      $ 	Collapsed=�6)   $ * 6`   $	 150Q�6j   $ 
CategoryId��6y    6@   �� *CategoreyId+6�     5z      $ * 6F   $	 150Q�6P   $ 	Book name��6_    6)   �� *
BookName+6t     5{      $ * 6D   $	 150Q�6N   $ Author��6]    6)   �� *Author+6o     5|      $ * 6G   $	 150Q�6Q   $ 	Publisher��6`    6)   �� *	Publishar+6u     5}      $ * 6I   $	 150Q�6S   $ Publish date��6b    6)   �� *PublishDate+6z     5~      $ * 6J   $	 150Q�6T   $ Language��6c    6)   �� *LanguageName+6w     5      $ * 6K   $	 150Q�6U   $ Category��6d    6)   �� *CategoreyName+6x   5�      5�      �� 5�   
   $��2��6   $��2��6"   $��Center=�66   $��Center=�6S   .+�5�      �� -   5        $ 	btnChoose��5�   D   $y�	Collapsed=�6-   .��6W   Choose6_   5�      5�      5�      