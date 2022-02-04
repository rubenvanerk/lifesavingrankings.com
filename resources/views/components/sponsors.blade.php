<div class="bg-blue-800">
    <div class="max-w-7xl mx-auto py-16 px-4 sm:py-20 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-extrabold text-white">
            {!! __('app.sponsors', ['style_open' => '<span class="text-amber-300">', 'style_close' => '</span>', 'html' => '<wbr/>']) !!}
        </h2>
        <div class="flow-root mt-8 lg:mt-10">
            <div class="-mt-4 -ml-8 flex flex-wrap justify-between lg:-ml-4">
                @foreach($sponsors as $sponsor)
                    <div class="mt-4 ml-8 flex grow shrink-0 lg:grow-0 lg:ml-4 text-white">
                        <img class="h-24" src="{{ $sponsor->getFirstMediaUrl('logo') }}"
                             alt="{{ $sponsor->name }}">
                    </div>
                @endforeach
                <div class="mt-4 ml-8 flex grow shrink-0 lg:grow-0 lg:ml-4">
                    <a href="https://ko-fi.com/lifesavingrankings" target="_blank"
                       class="relative block w-full border-2 border-gray-300 border-dashed rounded-lg p-3 text-center hover:border-gray-100 text-gray-100 hover:text-white hover:no-underline">
                        <x-heroicon-o-plus-circle class="mx-auto h12 w-12"/>
                        <span class="mt-2 block text-sm font-bold">Your Logo Here</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
