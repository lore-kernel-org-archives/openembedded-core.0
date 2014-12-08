Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62B36601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 18:06:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 08 Dec 2014 10:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="495567920"
Received: from justinda-mobl1.ger.corp.intel.com (HELO [10.255.13.236])
	([10.255.13.236])
	by orsmga003.jf.intel.com with ESMTP; 08 Dec 2014 10:02:28 -0800
Message-ID: <5485E88E.6060500@linux.intel.com>
Date: Mon, 08 Dec 2014 10:06:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Koen Kooi <koen@dominion.thruhere.net>
References: <1417851531-3540-1-git-send-email-sgw@linux.intel.com>
	<FB5AD677-B717-4E86-A600-524D77A13F09@dominion.thruhere.net>
	<CAJTo0LbKLrmVNiMs4oBvq1rbVhjCCdzR0CHgy2sJjRrb5uRj8A@mail.gmail.com>
In-Reply-To: <CAJTo0LbKLrmVNiMs4oBvq1rbVhjCCdzR0CHgy2sJjRrb5uRj8A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHi v3] procps: Upgrade to 3.3.10
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
X-List-Received-Date: Mon, 08 Dec 2014 18:06:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2014 05:46 AM, Burton, Ross wrote:
> On 6 December 2014 at 14:37, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>> If you feel bored, there's a stray backslash in DESCRIPTION and the '+='
>> for EXTRA_OECONF can be a regular '='. Next time I'll try to catch
>> everything in one go :)
>
>
> I thought a v4 was getting silly so fixed these as I merged it... but:
>
> ERROR: Function failed: Fetcher failure for URL:
> 'file://fix-configure.patch'. Unable to fetch URL from any source.
>
> Sorry Saul!
>
Wow!  I just can't seem to get this one right, thought I all the bits, 
but I guess I did not commit that patch.

Anything else?  Koen?
> Ross
>

