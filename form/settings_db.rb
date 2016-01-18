=begin
** Form generated from reading ui file 'setings_db.ui'
**
** Created: ╧э 18.  эт 10:27:02 2016
**      by: Qt User Interface Compiler version 4.8.6
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Option_db
    attr_reader :verticalLayout
    attr_reader :label_host_name
    attr_reader :edit_host_name
    attr_reader :label
    attr_reader :edit_user_name
    attr_reader :label_2
    attr_reader :edit_user_password
    attr_reader :verticalSpacer
    attr_reader :buttonBox

    def setupUi(option_db)
    if option_db.objectName.nil?
        option_db.objectName = "option_db"
    end
    option_db.resize(233, 300)
    @verticalLayout = Qt::VBoxLayout.new(option_db)
    @verticalLayout.objectName = "verticalLayout"
    @label_host_name = Qt::Label.new(option_db)
    @label_host_name.objectName = "label_host_name"

    @verticalLayout.addWidget(@label_host_name)

    @edit_host_name = Qt::LineEdit.new(option_db)
    @edit_host_name.objectName = "edit_host_name"

    @verticalLayout.addWidget(@edit_host_name)

    @label = Qt::Label.new(option_db)
    @label.objectName = "label"

    @verticalLayout.addWidget(@label)

    @edit_user_name = Qt::LineEdit.new(option_db)
    @edit_user_name.objectName = "edit_user_name"

    @verticalLayout.addWidget(@edit_user_name)

    @label_2 = Qt::Label.new(option_db)
    @label_2.objectName = "label_2"

    @verticalLayout.addWidget(@label_2)

    @edit_user_password = Qt::LineEdit.new(option_db)
    @edit_user_password.objectName = "edit_user_password"

    @verticalLayout.addWidget(@edit_user_password)

    @verticalSpacer = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @verticalLayout.addItem(@verticalSpacer)

    @buttonBox = Qt::DialogButtonBox.new(option_db)
    @buttonBox.objectName = "buttonBox"
    @buttonBox.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok

    @verticalLayout.addWidget(@buttonBox)


    retranslateUi(option_db)

    Qt::MetaObject.connectSlotsByName(option_db)
    end # setupUi

    def setup_ui(option_db)
        setupUi(option_db)
    end

    def retranslateUi(option_db)
    option_db.windowTitle = Qt::Application.translate("option_db", "Form", nil, Qt::Application::UnicodeUTF8)
    @label_host_name.text = Qt::Application.translate("option_db", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("option_db", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("option_db", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(option_db)
        retranslateUi(option_db)
    end

end

module Ui
    class Option_db < Ui_Option_db
    end
end  # module Ui

