Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D8BCC77D6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 12:48:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Aug 2017 05:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,421,1498546800"; d="scan'208";a="1187704602"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2017 05:48:37 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
	<9dd72f7d2ac352d71270250e2078907f3c9e0f94.1503507784.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=WxHev7q26Z+yus_9XCag9Aky2QLTfAA3sxU24PM3bL4w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f9708961-9ff7-7a5a-ba38-3aa7ab126ea0@linux.intel.com>
Date: Thu, 24 Aug 2017 15:45:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WxHev7q26Z+yus_9XCag9Aky2QLTfAA3sxU24PM3bL4w@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] sysprof: convert to meson build
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
X-List-Received-Date: Thu, 24 Aug 2017 12:48:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/23/2017 08:35 PM, Andre McCurdy wrote:
>>
>>   AUTOTOOLS_AUXDIR = "${S}/build-aux"
> 
> Presumably this can be dropped?

Yes, I'll amend the commit in git.

Please do trim your quotation. It's irritating to first search for your 
one line of comment, and then do the trimming for you when replying.


Alex


