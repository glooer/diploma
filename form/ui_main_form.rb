=begin
** Form generated from reading ui file 'ui_main_form.ui'
**
** Created: ╧э 25.  эт 12:29:32 2016
**      by: Qt User Interface Compiler version 4.8.6
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :options_db
    attr_reader :centralwidget
    attr_reader :gridLayout
    attr_reader :splitter
    attr_reader :tableView
    attr_reader :layoutWidget
    attr_reader :verticalLayout
    attr_reader :tabWidget
    attr_reader :tab
    attr_reader :gridLayout_2
    attr_reader :chk_lastName
    attr_reader :chk_birthDate
    attr_reader :chk_sex
    attr_reader :chk_patrName
    attr_reader :edit_birthDate
    attr_reader :edit_firstName
    attr_reader :edit_lastName
    attr_reader :chk_firstName
    attr_reader :edit_sex
    attr_reader :edit_patrName
    attr_reader :chk_SNILS
    attr_reader :chk_document
    attr_reader :edit_SNILS
    attr_reader :edit_documentType
    attr_reader :verticalSpacer
    attr_reader :checkBox
    attr_reader :lineEdit
    attr_reader :edit_documentSerial
    attr_reader :edit_documentNumber
    attr_reader :tab_2
    attr_reader :reset_or_ok
    attr_reader :menubar
    attr_reader :menu
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(517, 555)
    @options_db = Qt::Action.new(mainWindow)
    @options_db.objectName = "options_db"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @gridLayout = Qt::GridLayout.new(@centralwidget)
    @gridLayout.objectName = "gridLayout"
    @splitter = Qt::Splitter.new(@centralwidget)
    @splitter.objectName = "splitter"
    @splitter.orientation = Qt::Horizontal
    @tableView = Qt::TableView.new(@splitter)
    @tableView.objectName = "tableView"
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Expanding)
    @sizePolicy.setHorizontalStretch(1)
    @sizePolicy.setVerticalStretch(1)
    @sizePolicy.heightForWidth = @tableView.sizePolicy.hasHeightForWidth
    @tableView.sizePolicy = @sizePolicy
    @tableView.editTriggers = Qt::AbstractItemView::NoEditTriggers
    @tableView.setProperty("showDropIndicator", Qt::Variant.new(true))
    @tableView.alternatingRowColors = true
    @tableView.selectionMode = Qt::AbstractItemView::ContiguousSelection
    @tableView.selectionBehavior = Qt::AbstractItemView::SelectRows
    @tableView.showGrid = true
    @tableView.gridStyle = Qt::NoPen
    @tableView.sortingEnabled = true
    @tableView.cornerButtonEnabled = true
    @splitter.addWidget(@tableView)
    @layoutWidget = Qt::Widget.new(@splitter)
    @layoutWidget.objectName = "layoutWidget"
    @verticalLayout = Qt::VBoxLayout.new(@layoutWidget)
    @verticalLayout.objectName = "verticalLayout"
    @verticalLayout.setContentsMargins(0, 0, 0, 0)
    @tabWidget = Qt::TabWidget.new(@layoutWidget)
    @tabWidget.objectName = "tabWidget"
    @sizePolicy1 = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Expanding)
    @sizePolicy1.setHorizontalStretch(0)
    @sizePolicy1.setVerticalStretch(0)
    @sizePolicy1.heightForWidth = @tabWidget.sizePolicy.hasHeightForWidth
    @tabWidget.sizePolicy = @sizePolicy1
    @tabWidget.minimumSize = Qt::Size.new(100, 0)
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @sizePolicy2 = Qt::SizePolicy.new(Qt::SizePolicy::Preferred, Qt::SizePolicy::Preferred)
    @sizePolicy2.setHorizontalStretch(0)
    @sizePolicy2.setVerticalStretch(0)
    @sizePolicy2.heightForWidth = @tab.sizePolicy.hasHeightForWidth
    @tab.sizePolicy = @sizePolicy2
    @gridLayout_2 = Qt::GridLayout.new(@tab)
    @gridLayout_2.objectName = "gridLayout_2"
    @chk_lastName = Qt::CheckBox.new(@tab)
    @chk_lastName.objectName = "chk_lastName"

    @gridLayout_2.addWidget(@chk_lastName, 0, 0, 1, 2)

    @chk_birthDate = Qt::CheckBox.new(@tab)
    @chk_birthDate.objectName = "chk_birthDate"

    @gridLayout_2.addWidget(@chk_birthDate, 7, 0, 1, 1)

    @chk_sex = Qt::CheckBox.new(@tab)
    @chk_sex.objectName = "chk_sex"

    @gridLayout_2.addWidget(@chk_sex, 8, 0, 1, 1)

    @chk_patrName = Qt::CheckBox.new(@tab)
    @chk_patrName.objectName = "chk_patrName"

    @gridLayout_2.addWidget(@chk_patrName, 4, 0, 1, 2)

    @edit_birthDate = Qt::DateEdit.new(@tab)
    @edit_birthDate.objectName = "edit_birthDate"
    @edit_birthDate.enabled = false
    @edit_birthDate.minimumSize = Qt::Size.new(0, 0)

    @gridLayout_2.addWidget(@edit_birthDate, 7, 1, 1, 1)

    @edit_firstName = Qt::LineEdit.new(@tab)
    @edit_firstName.objectName = "edit_firstName"
    @edit_firstName.enabled = false

    @gridLayout_2.addWidget(@edit_firstName, 3, 0, 1, 2)

    @edit_lastName = Qt::LineEdit.new(@tab)
    @edit_lastName.objectName = "edit_lastName"
    @edit_lastName.enabled = false

    @gridLayout_2.addWidget(@edit_lastName, 1, 0, 1, 2)

    @chk_firstName = Qt::CheckBox.new(@tab)
    @chk_firstName.objectName = "chk_firstName"

    @gridLayout_2.addWidget(@chk_firstName, 2, 0, 1, 2)

    @edit_sex = Qt::ComboBox.new(@tab)
    @edit_sex.objectName = "edit_sex"
    @edit_sex.enabled = false
    @edit_sex.minimumSize = Qt::Size.new(0, 0)

    @gridLayout_2.addWidget(@edit_sex, 8, 1, 1, 1)

    @edit_patrName = Qt::LineEdit.new(@tab)
    @edit_patrName.objectName = "edit_patrName"
    @edit_patrName.enabled = false

    @gridLayout_2.addWidget(@edit_patrName, 5, 0, 1, 2)

    @chk_SNILS = Qt::CheckBox.new(@tab)
    @chk_SNILS.objectName = "chk_SNILS"

    @gridLayout_2.addWidget(@chk_SNILS, 10, 0, 1, 1)

    @chk_document = Qt::CheckBox.new(@tab)
    @chk_document.objectName = "chk_document"
    @chk_document.minimumSize = Qt::Size.new(0, 0)

    @gridLayout_2.addWidget(@chk_document, 11, 0, 1, 1)

    @edit_SNILS = Qt::LineEdit.new(@tab)
    @edit_SNILS.objectName = "edit_SNILS"
    @edit_SNILS.enabled = false
    @edit_SNILS.minimumSize = Qt::Size.new(0, 0)

    @gridLayout_2.addWidget(@edit_SNILS, 10, 1, 1, 1)

    @edit_documentType = Qt::ComboBox.new(@tab)
    @edit_documentType.objectName = "edit_documentType"
    @edit_documentType.enabled = false
    @edit_documentType.minimumSize = Qt::Size.new(0, 0)

    @gridLayout_2.addWidget(@edit_documentType, 11, 1, 1, 1)

    @verticalSpacer = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @gridLayout_2.addItem(@verticalSpacer, 13, 0, 1, 2)

    @checkBox = Qt::CheckBox.new(@tab)
    @checkBox.objectName = "checkBox"

    @gridLayout_2.addWidget(@checkBox, 9, 0, 1, 1)

    @lineEdit = Qt::LineEdit.new(@tab)
    @lineEdit.objectName = "lineEdit"
    @lineEdit.enabled = false
    @lineEdit.minimumSize = Qt::Size.new(0, 0)

    @gridLayout_2.addWidget(@lineEdit, 9, 1, 1, 1)

    @edit_documentSerial = Qt::LineEdit.new(@tab)
    @edit_documentSerial.objectName = "edit_documentSerial"
    @edit_documentSerial.enabled = false
    @edit_documentSerial.minimumSize = Qt::Size.new(10, 0)

    @gridLayout_2.addWidget(@edit_documentSerial, 12, 0, 1, 1)

    @edit_documentNumber = Qt::LineEdit.new(@tab)
    @edit_documentNumber.objectName = "edit_documentNumber"
    @edit_documentNumber.enabled = false
    @edit_documentNumber.minimumSize = Qt::Size.new(10, 0)

    @gridLayout_2.addWidget(@edit_documentNumber, 12, 1, 1, 1)

    @tabWidget.addTab(@tab, Qt::Application.translate("MainWindow", "\320\237\320\276\320\270\321\201\320\272", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @tabWidget.addTab(@tab_2, Qt::Application.translate("MainWindow", "\320\240\320\260\321\201\321\210\320\270\321\200\320\265\320\275\320\275\321\213\320\271 \320\277\320\276\320\270\321\201\320\272", nil, Qt::Application::UnicodeUTF8))

    @verticalLayout.addWidget(@tabWidget)

    @reset_or_ok = Qt::DialogButtonBox.new(@layoutWidget)
    @reset_or_ok.objectName = "reset_or_ok"
    @reset_or_ok.standardButtons = Qt::DialogButtonBox::Ok|Qt::DialogButtonBox::Reset
    @reset_or_ok.centerButtons = false

    @verticalLayout.addWidget(@reset_or_ok)

    @splitter.addWidget(@layoutWidget)

    @gridLayout.addWidget(@splitter, 0, 0, 1, 1)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 517, 21)
    @menu = Qt::Menu.new(@menubar)
    @menu.objectName = "menu"
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

    @menubar.addAction(@menu.menuAction())
    @menu.addAction(@options_db)

    retranslateUi(mainWindow)

    @tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "MainWindow", nil, Qt::Application::UnicodeUTF8)
    @options_db.text = Qt::Application.translate("MainWindow", "\320\221\320\224", nil, Qt::Application::UnicodeUTF8)
    @chk_lastName.text = Qt::Application.translate("MainWindow", "\320\244\320\260\320\274\320\270\320\273\320\270\321\217", nil, Qt::Application::UnicodeUTF8)
    @chk_birthDate.text = Qt::Application.translate("MainWindow", "\320\224\320\260\321\202\320\260 \321\200\320\276\320\266\320\264.", nil, Qt::Application::UnicodeUTF8)
    @chk_sex.text = Qt::Application.translate("MainWindow", "\320\237\320\276\320\273", nil, Qt::Application::UnicodeUTF8)
    @chk_patrName.text = Qt::Application.translate("MainWindow", "\320\236\321\202\321\207\320\265\321\201\321\202\320\262\320\276", nil, Qt::Application::UnicodeUTF8)
    @chk_firstName.text = Qt::Application.translate("MainWindow", "\320\230\320\274\321\217", nil, Qt::Application::UnicodeUTF8)
    @edit_sex.insertItems(0, [Qt::Application.translate("MainWindow", "\320\234", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("MainWindow", "\320\226", nil, Qt::Application::UnicodeUTF8)])
    @chk_SNILS.text = Qt::Application.translate("MainWindow", "\320\241\320\235\320\230\320\233\320\241", nil, Qt::Application::UnicodeUTF8)
    @chk_document.text = Qt::Application.translate("MainWindow", "\320\224\320\276\320\272\321\203\320\274\320\265\320\275\321\202", nil, Qt::Application::UnicodeUTF8)
    @edit_documentType.insertItems(0, [Qt::Application.translate("MainWindow", "\320\237\320\260\321\201\320\277\320\276\321\200\321\202", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("MainWindow", "123", nil, Qt::Application::UnicodeUTF8)])
    @checkBox.text = Qt::Application.translate("MainWindow", "\320\232\320\276\320\275\321\202\320\260\320\272\321\202?", nil, Qt::Application::UnicodeUTF8)
    @edit_documentSerial.placeholderText = Qt::Application.translate("MainWindow", "\320\241\320\265\321\200\320\270\321\217", nil, Qt::Application::UnicodeUTF8)
    @edit_documentNumber.placeholderText = Qt::Application.translate("MainWindow", "\320\235\320\276\320\274\320\265\321\200", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab), Qt::Application.translate("MainWindow", "\320\237\320\276\320\270\321\201\320\272", nil, Qt::Application::UnicodeUTF8))
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_2), Qt::Application.translate("MainWindow", "\320\240\320\260\321\201\321\210\320\270\321\200\320\265\320\275\320\275\321\213\320\271 \320\277\320\276\320\270\321\201\320\272", nil, Qt::Application::UnicodeUTF8))
    @menu.title = Qt::Application.translate("MainWindow", "\320\235\320\260\321\201\321\202\321\200\320\276\320\271\320\272\320\270", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

