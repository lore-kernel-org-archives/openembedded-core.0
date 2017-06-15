Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8F50D78406
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 20:45:54 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 15 Jun 2017 13:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,344,1493708400"; d="scan'208";a="98417760"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 15 Jun 2017 13:45:53 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
	<1fcd2f1adf3506cc8d22cbbc538ffb7e1eebbf8f.1497453168.git.raj.khem@gmail.com>
	<225c958a-3bd3-b8b7-8447-53dc8a4d34ec@linux.intel.com>
	<CAMKF1sotA4FHmA3oinKzF95P2+aSr54JbbT4UdCMiATO9Zuj7w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <db9dab56-437e-3568-94ef-dcffd637caee@linux.intel.com>
Date: Thu, 15 Jun 2017 23:46:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sotA4FHmA3oinKzF95P2+aSr54JbbT4UdCMiATO9Zuj7w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] gobject-introspection: Disable generating static lbraries
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
X-List-Received-Date: Thu, 15 Jun 2017 20:45:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 07:02 PM, Khem Raj wrote:
> On Thu, Jun 15, 2017 at 2:50 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 06/14/2017 06:23 PM, Khem Raj wrote:
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>>
>> Why? You need to add an explanation to the commit message.
>>
> sure, its to avoid linking with .a when using pie


Can you resend the patch please?

Alex


