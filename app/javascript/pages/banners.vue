<template>
  <div>
    <table class="min-w-full table-auto">
      <thead class="justify-between">
        <tr class="bg-gray-800">
          <th class="px-16 py-2">
            <span class="text-gray-300"></span>
          </th>
          <th class="px-16 py-2">
            <span class="text-gray-300">Name</span>
          </th>
          <th class="px-16 py-2">
            <span class="text-gray-300">Invitation</span>
          </th>
          <th class="px-16 py-2">
            <span class="text-gray-300">Date</span>
          </th>

          <th class="px-16 py-2">
            <span class="text-gray-300">Time</span>
          </th>

          <th class="px-16 py-2">
            <span class="text-gray-300">Status</span>
          </th>
        </tr>
      </thead>
      <tbody class="bg-gray-200">
        <tr class="bg-white border-4 border-gray-200">
          <td class="px-16 py-2 flex flex-row items-center">
            <img
              class="h-8 w-8 rounded-full object-cover "
              src="https://randomuser.me/api/portraits/men/30.jpg"
              alt=""
            />
          </td>
          <td>
            <span class="text-center ml-2 font-semibold">Dean Lynch</span>
          </td>
          <td class="px-16 py-2">
            <button
              class="bg-indigo-500 text-white px-4 py-2 border rounded-md hover:bg-white hover:border-indigo-500 hover:text-black "
            >
              Open Link
            </button>
          </td>
          <td class="px-16 py-2">
            <span>05/06/2020</span>
          </td>
          <td class="px-16 py-2">
            <span>10:00</span>
          </td>

          <td class="px-16 py-2">
            <span class="text-green-500">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="w-5 h5 "
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="#2c3e50"
                fill="none"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <path stroke="none" d="M0 0h24v24H0z" />
                <path d="M5 12l5 5l10 -10" />
              </svg>
            </span>
          </td>
        </tr>
        <tr class="bg-white border-4 border-gray-200">
          <td class="px-16 py-2 flex flex-row items-center">
            <img
              class="h-8 w-8 rounded-full object-cover "
              src="https://randomuser.me/api/portraits/men/76.jpg"
              alt=""
            />
          </td>
          <td>
            <span class="text-center ml-2 font-semibold">Ralph Barnes</span>
          </td>
          <td class="px-16 py-2">
            <button
              class="bg-indigo-500 text-white px-4 py-2 border rounded-md hover:bg-white hover:border-indigo-500 hover:text-black "
            >
              Open Link
            </button>
          </td>
          <td class="px-16 py-2">
            <span>05/06/2020</span>
          </td>
          <td class="px-16 py-2">
            <span>12:15</span>
          </td>

          <td class="px-16 py-2">
            <span class="text-yellow-500">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="w-5 h-5"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="#2c3e50"
                fill="none"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <path stroke="none" d="M0 0h24v24H0z" />
                <circle cx="12" cy="12" r="9" />
                <polyline points="12 7 12 12 15 15" />
              </svg>
            </span>
          </td>
        </tr>
        <tr class="bg-white border-4 border-gray-200">
          <td class="px-16 py-2 flex flex-row items-center">
            <img
              class="h-8 w-8 rounded-full object-cover "
              src="https://randomuser.me/api/portraits/men/38.jpg"
              alt=""
            />
          </td>
          <td>
            <span class="text-center ml-2 font-semibold">Brett Castillo</span>
          </td>
          <td class="px-16 py-2">
            <button
              class="bg-indigo-500 text-white px-4 py-2 border rounded-md hover:bg-white hover:border-indigo-500 hover:text-black "
            >
              Open Link
            </button>
          </td>
          <td class="px-16 py-2">
            <span>05/06/2020</span>
          </td>
          <td class="px-16 py-2">
            <span>08:35</span>
          </td>

          <td class="px-16 py-2">
            <span class="text-yellow-500">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="w-5 h-5"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="#2c3e50"
                fill="none"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <path stroke="none" d="M0 0h24v24H0z" />
                <line x1="18" y1="6" x2="6" y2="18" />
                <line x1="6" y1="6" x2="18" y2="18" />
              </svg>
            </span>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- ----------------------- -->
    <div
      class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col my-2"
    >
      <div class="-mx-3 md:flex mb-6">
        <div class="md:w-1/2 px-3 mb-6 md:mb-0">
          <label
            class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2"
            for="grid-first-name"
          >
            First Name
          </label>
          <input
            class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3"
            id="grid-first-name"
            type="text"
            placeholder="Jane"
          />
          <p class="text-red text-xs italic">Please fill out this field.</p>
        </div>
        <div class="md:w-1/2 px-3">
          <label
            class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2"
            for="grid-last-name"
          >
            Last Name
          </label>
          <input
            class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4"
            id="grid-last-name"
            type="text"
            placeholder="Doe"
          />
        </div>
      </div>
      <div class="-mx-3 md:flex mb-6">
        <div class="md:w-full px-3">
          <label
            class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2"
            for="grid-password"
          >
            Password
          </label>
          <input
            class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4 mb-3"
            id="grid-password"
            type="password"
            placeholder="******************"
          />
          <p class="text-grey-dark text-xs italic">
            Make it as long and as crazy as you'd like
          </p>
        </div>
      </div>
      <div class="-mx-3 md:flex mb-2">
        <div class="md:w-1/2 px-3 mb-6 md:mb-0">
          <label
            class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2"
            for="grid-city"
          >
            City
          </label>
          <input
            class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4"
            id="grid-city"
            type="text"
            placeholder="Albuquerque"
          />
        </div>
        <div class="md:w-1/2 px-3">
          <label
            class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2"
            for="grid-state"
          >
            State
          </label>
          <div class="relative">
            <select
              class="block appearance-none w-full bg-grey-lighter border border-grey-lighter text-grey-darker py-3 px-4 pr-8 rounded"
              id="grid-state"
            >
              <option>New Mexico</option>
              <option>Missouri</option>
              <option>Texas</option>
            </select>
            <div
              class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker"
            >
              <svg
                class="h-4 w-4"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
              >
                <path
                  d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"
                />
              </svg>
            </div>
          </div>
        </div>
        <div class="md:w-1/2 px-3">
          <label
            class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2"
            for="grid-zip"
          >
            Zip
          </label>
          <input
            class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4"
            id="grid-zip"
            type="text"
            placeholder="90210"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
</style>