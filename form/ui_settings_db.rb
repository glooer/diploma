=begin
** Form generated from reading ui file 'ui_settings_db.ui'
**
** Created: ╧э 25.  эт 11:43:33 2016
**      by: Qt User Interface Compiler version 4.8.6
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Settings_db
    attr_reader :verticalLayout
    attr_reader :groupBox
    attr_reader :verticalLayout_2
    attr_reader :label_host_name
    attr_reader :edit_host_name
    attr_reader :label_port
    attr_reader :edit_port
    attr_reader :label_db_name
    attr_reader :edit_db_name
    attr_reader :groupBox_2
    attr_reader :verticalLayout_3
    attr_reader :label_user_name
    attr_reader :edit_user_name
    attr_reader :label_user_password
    attr_reader :edit_user_password
    attr_reader :verticalSpacer
    attr_reader :buttonBox

    def setupUi(settings_db)
    if settings_db.objectName.nil?
        settings_db.objectName = "settings_db"
    end
    settings_db.resize(174, 338)
    @verticalLayout = Qt::VBoxLayout.new(settings_db)
    @verticalLayout.objectName = "verticalLayout"
    @groupBox = Qt::GroupBox.new(settings_db)
    @groupBox.objectName = "groupBox"
    @verticalLayout_2 = Qt::VBoxLayout.new(@groupBox)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @label_host_name = Qt::Label.new(@groupBox)
    @label_host_name.objectName = "label_host_name"

    @verticalLayout_2.addWidget(@label_host_name)

    @edit_host_name = Qt::LineEdit.new(@groupBox)
    @edit_host_name.objectName = "edit_host_name"

    @verticalLayout_2.addWidget(@edit_host_name)

    @label_port = Qt::Label.new(@groupBox)
    @label_port.objectName = "label_port"

    @verticalLayout_2.addWidget(@label_port)

    @edit_port = Qt::SpinBox.new(@groupBox)
    @edit_port.objectName = "edit_port"
    @edit_port.maximum = 99999
    @edit_port.value = 3306

    @verticalLayout_2.addWidget(@edit_port)

    @label_db_name = Qt::Label.new(@groupBox)
    @label_db_name.objectName = "label_db_name"

    @verticalLayout_2.addWidget(@label_db_name)

    @edit_db_name = Qt::LineEdit.new(@groupBox)
    @edit_db_name.objectName = "edit_db_name"

    @verticalLayout_2.addWidget(@edit_db_name)


    @verticalLayout.addWidget(@groupBox)

    @groupBox_2 = Qt::GroupBox.new(settings_db)
    @groupBox_2.objectName = "groupBox_2"
    @verticalLayout_3 = Qt::VBoxLayout.new(@groupBox_2)
    @verticalLayout_3.objectName = "verticalLayout_3"
    @label_user_name = Qt::Label.new(@groupBox_2)
    @label_user_name.objectName = "label_user_name"

    @verticalLayout_3.addWidget(@label_user_name)

    @edit_user_name = Qt::LineEdit.new(@groupBox_2)
    @edit_user_name.objectName = "edit_user_name"

    @verticalLayout_3.addWidget(@edit_user_name)

    @label_user_password = Qt::Label.new(@groupBox_2)
    @label_user_password.objectName = "label_user_password"

    @verticalLayout_3.addWidget(@label_user_password)

    @edit_user_password = Qt::LineEdit.new(@groupBox_2)
    @edit_user_password.objectName = "edit_user_password"
    @edit_user_password.echoMode = Qt::LineEdit::Password

    @verticalLayout_3.addWidget(@edit_user_password)


    @verticalLayout.addWidget(@groupBox_2)

    @verticalSpacer = Qt::SpacerItem.new(20, 0, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @verticalLayout.addItem(@verticalSpacer)

    @buttonBox = Qt::DialogButtonBox.new(settings_db)
    @buttonBox.objectName = "buttonBox"
    @buttonBox.orientation = Qt::Horizontal
    @buttonBox.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok

    @verticalLayout.addWidget(@buttonBox)


    retranslateUi(settings_db)
    Qt::Object.connect(@buttonBox, SIGNAL('accepted()'), settings_db, SLOT('accept()'))
    Qt::Object.connect(@buttonBox, SIGNAL('rejected()'), settings_db, SLOT('reject()'))

    Qt::MetaObject.connectSlotsByName(settings_db)
    end # setupUi

    def setup_ui(settings_db)
        setupUi(settings_db)
    end

    def retranslateUi(settings_db)
    settings_db.windowTitle = Qt::Application.translate("settings_db", "\320\235\320\260\321\201\321\202\321\200\320\276\320\271\320\272\320\270 \320\221\320\260\320\267\321\213 \320\224\320\260\320\275\320\275\321\213\321\205", nil, Qt::Application::UnicodeUTF8)
    @groupBox.title = Qt::Application.translate("settings_db", "\320\241\320\265\321\200\320\262\320\265\321\200", nil, Qt::Application::UnicodeUTF8)
    @label_host_name.text = Qt::Application.translate("settings_db", "\320\220\320\264\321\200\320\265\321\201", nil, Qt::Application::UnicodeUTF8)
    @label_port.text = Qt::Application.translate("settings_db", "\320\237\320\276\321\200\321\202", nil, Qt::Application::UnicodeUTF8)
    @label_db_name.text = Qt::Application.translate("settings_db", "\320\221\320\260\320\267\320\260", nil, Qt::Application::UnicodeUTF8)
    @groupBox_2.title = Qt::Application.translate("settings_db", "\320\237\320\276\320\273\321\214\320\267\320\276\320\262\320\260\321\202\320\265\320\273\321\214", nil, Qt::Application::UnicodeUTF8)
    @label_user_name.text = Qt::Application.translate("settings_db", "\320\230\320\274\321\217", nil, Qt::Application::UnicodeUTF8)
    @label_user_password.text = Qt::Application.translate("settings_db", "\320\237\320\260\321\200\320\276\320\273\321\214", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(settings_db)
        retranslateUi(settings_db)
    end

end

module Ui
    class Settings_db < Ui_Settings_db
    end
end  # module Ui

