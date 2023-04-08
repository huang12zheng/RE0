cd $(dirname $0)
# service_items="acs calendar helpdesk sheets admin contact hire speech_to_text application corehr human_authentication task approval docx im tenant attendance drive mail translation auth ehr meeting_room vc authen event okr wiki baike ext optical_char_recognition bitable face_detection passport block gray_test_open_sg search"
mkdir -p card core event service
$(
cd service
mkdir acs calendar helpdesk sheets admin contact hire speech_to_text application corehr human_authentication task approval docx im tenant attendance drive mail translation auth ehr meeting_room vc authen event okr wiki baike ext optical_char_recognition bitable face_detection passport block gray_test_open_sg search
touch acs.thrift calendar.thrift helpdesk.thrift sheets.thrift admin.thrift contact.thrift hire.thrift speech_to_text.thrift application.thrift corehr.thrift human_authentication.thrift task.thrift approval.thrift docx.thrift im.thrift tenant.thrift attendance.thrift drive.thrift mail.thrift translation.thrift auth.thrift ehr.thrift meeting_room.thrift vc.thrift authen.thrift event.thrift okr.thrift wiki.thrift baike.thrift ext.thrift optical_char_recognition.thrift bitable.thrift face_detection.thrift passport.thrift block.thrift gray_test_open_sg.thrift search.thrift
)
$(
    cd core
    touch apireq.thrift config.thrift httptransport.thrift serialization.thrift apiresp.thrift constants.thrift httptransport_test.thrift tokenmanager.thrift appticketmanager.thrift errors.thrift logger.thrift tokenmanager_test.thrift appticketmanager_test.thrift httpclient.thrift reqoption.thrift utils.thrift cache.thrift httpclient_test.thrift reqtranslator.thrift utils_test.thrift cache_test.thrift reqtranslator_test.thrift version.thrift
)