<div class="shadow sm:hidden">
    <ul class="mt-2 divide-y divide-gray-200 overflow-hidden shadow sm:hidden">
        @foreach(range(1, 6) as $number)
            <li>
                <span class="block px-4 py-4 bg-white">
                    <span class="flex items-center space-x-4">
                          <span class="flex-1 flex space-x-2 truncate">
                              <img class="flex-shrink-0 w-5 h-5 rounded-md"
                                 src="{{ url('/pragmarx/countries/flag/download/ita.svg') }}">
                              <span class="flex flex-col text-gray-500 text-sm truncate w-full leading-relaxed">
                                  <a href="" class="truncate hover:text-gray-900">Lucrezia Fabretti</a>
                                  <a href="" class="truncate hover:text-gray-900">100m manikin carry with fins</a>
                                  <span class="flex">
                                      <span class="text-gray-900 font-medium flex-grow">0:49.33</span>
                                      <a href="" class="hover:text-gray-900">
                                          <time datetime="2020-07-11">July 11, 2020</time>
                                      </a>
                                  </span>
                              </span>
                          </span>
                    </span>
                </span>
            </li>
        @endforeach
    </ul>

    @if ($pagination ?? false)
        <nav class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200"
             aria-label="Pagination">
            <div class="flex-1 flex justify-between">
                <a href="#"
                   class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:text-gray-500">
                    Previous
                </a>
                <a href="#"
                   class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:text-gray-500">
                    Next
                </a>
            </div>
        </nav>
    @endif
</div>

<div class="hidden sm:block">
    <div class="w-full mx-auto p-5">
        <div class="flex flex-col mt-2">
            <div class="align-middle min-w-full overflow-x-auto shadow overflow-hidden sm:rounded-lg">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead>
                    <tr>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Event
                        </th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Athlete
                        </th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Time
                        </th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Date
                        </th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider hidden lg:block">
                            Competition
                        </th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">

                    @foreach(range(1, 6) as $number)
                        <tr class="bg-white">
                            <td class="max-w-0 w-full px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                <div class="flex">
                                    <a href="#"
                                       class="group inline-flex space-x-2 truncate text-sm focus:text-yellow-300">
                                        <p class="text-blue-900 truncate group-hover:text-gray-900 group-hover:underline ">
                                            100m manikin carry with fins
                                        </p>
                                    </a>
                                </div>
                            </td>
                            <td class="w-full px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                <div class="flex">
                                    <a href="#" class="group inline-flex space-x-2 text-sm">
                                        <img class="w-5 h-5 rounded-md"
                                             src="{{ url('/pragmarx/countries/flag/download/ita.svg') }}">
                                        <p class="text-gray-500 group-hover:text-gray-900">
                                            Lucrezia FABRETTI
                                        </p>
                                    </a>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                0:49.33
                            </td>
                            <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500">
                                <time datetime="2020-07-11">July 11, 2020</time>
                            </td>
                            <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500 truncate hidden lg:block">
                                European Championships National Teams Open 2019
                            </td>
                        </tr>
                    @endforeach

                    </tbody>
                </table>

                @if ($pagination ?? false)
                    <nav class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6"
                         aria-label="Pagination">
                        <div class="hidden sm:block">
                            <p class="text-sm text-gray-700">
                                Showing
                                <span class="font-medium">1</span>
                                to
                                <span class="font-medium">10</span>
                                of
                                <span class="font-medium">20</span>
                                results
                            </p>
                        </div>
                        <div class="flex-1 flex justify-between sm:justify-end">
                            <a href="#"
                               class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                                Previous
                            </a>
                            <a href="#"
                               class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                                Next
                            </a>
                        </div>
                    </nav>
                @endif
            </div>
        </div>
    </div>
</div>
