class UserSerializer < ApplicationSerializer
    attributes :id, :email, :name, :user_meds, :doctor

    def user_meds
        ActiveModel::SerializableResource.new(object.user_meds,  each_serializer: UserMedSerializer)
    end

    def doctor
        {name: self.object.doctor.name, email: self.object.doctor.email, id: self.object.doctor.id}
    end
end 