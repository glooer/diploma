=begin
** Form generated from reading ui file 'untitled.ui'
**
** Created: Яђ 15. џэт 17:47:15 2016
**      by: Qt User Interface Compiler version 4.8.6
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Form
    attr_reader :gridLayout
    attr_reader :tableView
    attr_reader :tabWidget
    attr_reader :tab
    attr_reader :gridLayout_2
    attr_reader :verticalSpacer
    attr_reader :chk_firstName
    attr_reader :edit_firstName
    attr_reader :chk_lastName
    attr_reader :chk_patrName
    attr_reader :edit_patrName
    attr_reader :chk_birthDate
    attr_reader :edit_lastName
    attr_reader :edit_birthDate
    attr_reader :reset_or_ok

    def setupUi(form)
    if form.objectName.nil?
        form.objectName = "form"
    end
    form.resize(630, 541)
    @gridLayout = Qt::GridLayout.new(form)
    @gridLayout.objectName = "gridLayout"
    @tableView = Qt::TableView.new(form)
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

    @gridLayout.addWidget(@tableView, 0, 0, 2, 1)

    @tabWidget = Qt::TabWidget.new(form)
    @tabWidget.objectName = "tabWidget"
    @tabWidget.minimumSize = Qt::Size.new(200, 0)
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @gridLayout_2 = Qt::GridLayout.new(@tab)
    @gridLayout_2.objectName = "gridLayout_2"
    @verticalSpacer = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @gridLayout_2.addItem(@verticalSpacer, 8, 0, 1, 1)

    @chk_firstName = Qt::CheckBox.new(@tab)
    @chk_firstName.objectName = "chk_firstName"

    @gridLayout_2.addWidget(@chk_firstName, 2, 0, 1, 1)

    @edit_firstName = Qt::LineEdit.new(@tab)
    @edit_firstName.objectName = "edit_firstName"
    @edit_firstName.enabled = false

    @gridLayout_2.addWidget(@edit_firstName, 3, 0, 1, 1)

    @chk_lastName = Qt::CheckBox.new(@tab)
    @chk_lastName.objectName = "chk_lastName"

    @gridLayout_2.addWidget(@chk_lastName, 0, 0, 1, 1)

    @chk_patrName = Qt::CheckBox.new(@tab)
    @chk_patrName.objectName = "chk_patrName"

    @gridLayout_2.addWidget(@chk_patrName, 4, 0, 1, 1)

    @edit_patrName = Qt::LineEdit.new(@tab)
    @edit_patrName.objectName = "edit_patrName"
    @edit_patrName.enabled = false

    @gridLayout_2.addWidget(@edit_patrName, 5, 0, 1, 1)

    @chk_birthDate = Qt::CheckBox.new(@tab)
    @chk_birthDate.objectName = "chk_birthDate"

    @gridLayout_2.addWidget(@chk_birthDate, 6, 0, 1, 1)

    @edit_lastName = Qt::LineEdit.new(@tab)
    @edit_lastName.objectName = "edit_lastName"
    @edit_lastName.enabled = false

    @gridLayout_2.addWidget(@edit_lastName, 1, 0, 1, 1)

    @edit_birthDate = Qt::DateEdit.new(@tab)
    @edit_birthDate.objectName = "edit_birthDate"
    @edit_birthDate.enabled = false

    @gridLayout_2.addWidget(@edit_birthDate, 7, 0, 1, 1)

    @tabWidget.addTab(@tab, Qt::Application.translate("Form", "Tab 1", nil, Qt::Application::UnicodeUTF8))

    @gridLayout.addWidget(@tabWidget, 0, 1, 1, 1)

    @reset_or_ok = Qt::DialogButtonBox.new(form)
    @reset_or_ok.objectName = "reset_or_ok"
    @reset_or_ok.standardButtons = Qt::DialogButtonBox::Ok|Qt::DialogButtonBox::Reset
    @reset_or_ok.centerButtons = false

    @gridLayout.addWidget(@reset_or_ok, 1, 1, 1, 1)

    Qt::Widget.setTabOrder(@chk_lastName, @edit_lastName)
    Qt::Widget.setTabOrder(@edit_lastName, @chk_firstName)
    Qt::Widget.setTabOrder(@chk_firstName, @edit_firstName)
    Qt::Widget.setTabOrder(@edit_firstName, @chk_patrName)
    Qt::Widget.setTabOrder(@chk_patrName, @edit_patrName)
    Qt::Widget.setTabOrder(@edit_patrName, @chk_birthDate)
    Qt::Widget.setTabOrder(@chk_birthDate, @edit_birthDate)
    Qt::Widget.setTabOrder(@edit_birthDate, @tableView)
    Qt::Widget.setTabOrder(@tableView, @reset_or_ok)
    Qt::Widget.setTabOrder(@reset_or_ok, @tabWidget)

    retranslateUi(form)

    @tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(form)
    end # setupUi

    def setup_ui(form)
        setupUi(form)
    end

    def retranslateUi(form)
    form.windowTitle = Qt::Application.translate("Form", "Form", nil, Qt::Application::UnicodeUTF8)
    @chk_firstName.text = Qt::Application.translate("Form", "\320\230\320\274\321\217", nil, Qt::Application::UnicodeUTF8)
    @chk_lastName.text = Qt::Application.translate("Form", "\320\244\320\260\320\274\320\270\320\273\320\270\321\217", nil, Qt::Application::UnicodeUTF8)
    @chk_patrName.text = Qt::Application.translate("Form", "\320\236\321\202\321\207\320\265\321\201\321\202\320\262\320\276", nil, Qt::Application::UnicodeUTF8)
    @chk_birthDate.text = Qt::Application.translate("Form", "\320\224\320\260\321\202\320\260 \321\200\320\276\320\266\320\264\320\265\320\275\320\270\321\217", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab), Qt::Application.translate("Form", "Tab 1", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(form)
        retranslateUi(form)
    end

end

module Ui
    class Form < Ui_Form
    end
end  # module Ui

