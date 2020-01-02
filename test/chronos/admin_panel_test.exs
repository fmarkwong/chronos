defmodule Chronos.AdminPanelTest do
  use Chronos.DataCase

  alias Chronos.AdminPanel

  describe "clients" do
    alias Chronos.AdminPanel.Client

    @valid_attrs %{bed_number: "some bed_number", dorm: "some dorm", initials: "some initials"}
    @update_attrs %{
      bed_number: "some updated bed_number",
      dorm: "some updated dorm",
      initials: "some updated initials"
    }
    @invalid_attrs %{bed_number: nil, dorm: nil, initials: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AdminPanel.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert AdminPanel.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert AdminPanel.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = AdminPanel.create_client(@valid_attrs)
      assert client.bed_number == "some bed_number"
      assert client.dorm == "some dorm"
      assert client.initials == "some initials"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AdminPanel.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = AdminPanel.update_client(client, @update_attrs)
      assert client.bed_number == "some updated bed_number"
      assert client.dorm == "some updated dorm"
      assert client.initials == "some updated initials"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = AdminPanel.update_client(client, @invalid_attrs)
      assert client == AdminPanel.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = AdminPanel.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> AdminPanel.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = AdminPanel.change_client(client)
    end
  end

  describe "admins" do
    alias Chronos.AdminPanel.Admin

    @valid_attrs %{role: "some role"}
    @update_attrs %{role: "some updated role"}
    @invalid_attrs %{role: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AdminPanel.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert AdminPanel.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert AdminPanel.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = AdminPanel.create_admin(@valid_attrs)
      assert admin.role == "some role"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AdminPanel.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = AdminPanel.update_admin(admin, @update_attrs)
      assert admin.role == "some updated role"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = AdminPanel.update_admin(admin, @invalid_attrs)
      assert admin == AdminPanel.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = AdminPanel.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> AdminPanel.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = AdminPanel.change_admin(admin)
    end
  end

  describe "appointments" do
    alias Chronos.AdminPanel.Appointment

    @valid_attrs %{date_time: "2010-04-17T14:00:00Z", name: "some name", type: "some type"}
    @update_attrs %{
      date_time: "2011-05-18T15:01:01Z",
      name: "some updated name",
      type: "some updated type"
    }
    @invalid_attrs %{date_time: nil, name: nil, type: nil}

    def appointment_fixture(attrs \\ %{}) do
      {:ok, appointment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AdminPanel.create_appointment()

      appointment
    end

    test "list_appointments/0 returns all appointments" do
      appointment = appointment_fixture()
      assert AdminPanel.list_appointments() == [appointment]
    end

    test "get_appointment!/1 returns the appointment with given id" do
      appointment = appointment_fixture()
      assert AdminPanel.get_appointment!(appointment.id) == appointment
    end

    test "create_appointment/1 with valid data creates a appointment" do
      assert {:ok, %Appointment{} = appointment} = AdminPanel.create_appointment(@valid_attrs)
      assert appointment.date_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert appointment.name == "some name"
      assert appointment.type == "some type"
    end

    test "create_appointment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AdminPanel.create_appointment(@invalid_attrs)
    end

    test "update_appointment/2 with valid data updates the appointment" do
      appointment = appointment_fixture()

      assert {:ok, %Appointment{} = appointment} =
               AdminPanel.update_appointment(appointment, @update_attrs)

      assert appointment.date_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert appointment.name == "some updated name"
      assert appointment.type == "some updated type"
    end

    test "update_appointment/2 with invalid data returns error changeset" do
      appointment = appointment_fixture()

      assert {:error, %Ecto.Changeset{}} =
               AdminPanel.update_appointment(appointment, @invalid_attrs)

      assert appointment == AdminPanel.get_appointment!(appointment.id)
    end

    test "delete_appointment/1 deletes the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{}} = AdminPanel.delete_appointment(appointment)
      assert_raise Ecto.NoResultsError, fn -> AdminPanel.get_appointment!(appointment.id) end
    end

    test "change_appointment/1 returns a appointment changeset" do
      appointment = appointment_fixture()
      assert %Ecto.Changeset{} = AdminPanel.change_appointment(appointment)
    end
  end
end
