Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DA65F77AF0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:36:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 21 Apr 2017 05:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="848386429"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2017 05:36:53 -0700
To: openembedded-core@lists.openembedded.org
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<CADkTA4Pi7SWq_PrYYJZiJa0CQUU-EN+ZVxPTPZV0Z8SvAYjcaA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <64a94df4-970f-b80c-3e43-0f6d75c52ba4@linux.intel.com>
Date: Fri, 21 Apr 2017 15:36:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Pi7SWq_PrYYJZiJa0CQUU-EN+ZVxPTPZV0Z8SvAYjcaA@mail.gmail.com>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Fri, 21 Apr 2017 12:36:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2017 03:26 PM, Bruce Ashfield wrote:

>     Anyone else seeing this as well?
>
>
>
> Richard saw this once last week, and we weren't able to reproduce it.
> I've just updated
> and am doing builds now.
>
> If anyone has info on their config, build steps, etc, I'm interested to
> hear so I can figure
> out what is going on.

I saw this once as well today. I nuked tmp/ and it was gone.

Alex


