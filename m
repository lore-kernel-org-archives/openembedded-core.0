Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BB61E609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 19:39:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2014 12:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,590,1400050800"; d="scan'208";a="567448553"
Received: from unknown (HELO [10.255.12.237]) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2014 12:39:26 -0700
Message-ID: <53B45FDC.1050703@linux.intel.com>
Date: Wed, 02 Jul 2014 12:39:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>, 
	Ming Liu <ming.liu@windriver.com>
References: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
	<CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
In-Reply-To: <CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: add usleep support from RHEL
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
X-List-Received-Date: Wed, 02 Jul 2014 19:40:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2014 10:37 AM, Christopher Larson wrote:
> On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu <ming.liu@windriver.com> wrote:
>
>> Add usleep in to support sleeping some number of microseconds.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>
>
> Maybe it's just me, but initscripts seems like a horrible place to put this.
>
>
>
It's not just you!  Not sure why it's being added here and I don't see 
any usage of it, so more information is required.

Sau!

