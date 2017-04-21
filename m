Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2844D77AA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:38:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Apr 2017 05:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="848386684"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2017 05:38:02 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1491876119-195521-1-git-send-email-dengke.du@windriver.com>
	<2f2ca19a-5af9-aa71-23bc-c2d30ea43445@windriver.com>
	<1492411399.19076.58.camel@linuxfoundation.org>
	<067fa2dd-24ee-60bc-4a27-ddf886d66408@linux.intel.com>
	<CAJTo0LYrNYscMvV5JBoSq2yicg0KEhyvH0Ao=UxEasQJUgyToA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0fdddc1c-ee0b-a491-67d6-410aed103c02@linux.intel.com>
Date: Fri, 21 Apr 2017 15:37:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYrNYscMvV5JBoSq2yicg0KEhyvH0Ao=UxEasQJUgyToA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: upgrade to 7.5p1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Apr 2017 12:38:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2017 01:20 PM, Burton, Ross wrote:
>     Yes, but... people keep doing it despite you and me and everyone
>     else telling them not to. How about someone would stash those
>     updates to a kind of 'master-next-next' branch, and dump them to the
>     list again when the merge window reopens? I can do that, if I would
>     get a clear indication of when that work should start and finish.
>
>
> FWIW I'm collecting patches in ross/mut for when master re-opens.
> They've been posted to the list so don't need re-posting.

That's great, then I can send some things that have piled up now :)


Alex


