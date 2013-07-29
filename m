Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D0C7F6AFB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 16:20:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2013 09:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,771,1367996400"; d="scan'208";a="372968201"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2013 09:20:12 -0700
Message-ID: <51F6963C.1010009@linux.intel.com>
Date: Mon, 29 Jul 2013 09:20:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1375110365.git.sgw@linux.intel.com>
	<6339709.CFmXEXRQnE@helios> <1375114624.5851.5.camel@ted>
In-Reply-To: <1375114624.5851.5.camel@ted>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (Part 2) (resend) 00/26] Branch Updated with Correct Set
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
X-List-Received-Date: Mon, 29 Jul 2013 16:20:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2013 09:17 AM, Richard Purdie wrote:
> On Mon, 2013-07-29 at 16:49 +0100, Paul Eggleton wrote:
>> On Monday 29 July 2013 08:07:51 Saul Wold wrote:
>>> Branch is updated, sorry not sure what happened with the
>>> obex and texinfo, I thought I had removed them since they did not
>>> show up in the summary below (in the first email).
>>>
>>> Already basicly ACK'ed by Ross and Paul
>>>
>>> Thanks
>>> Sau!
>>>
>>> The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
>>>
>>>    external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage2
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
>>> stage2
>>>
>>> Andrei Dinu (1):
>>>    libpng : upgrade to 1.6.3
>>>
>>> Emilia Ciobanu (14):
>>>    babeltrace: fix recipe name
>>>    build-appliance-image: fix recipe name add GIT revision to PV variable
>>>    chkconfig-alternatives-native: fix recipe name and add GIT revision to
>>>      PV variable
>>>    connman-gnome: fix recipe name add GIT revision to PV variable
>>>    docbook-sgml-dtd-3.1-native: fix recipe name
>>>    docbook-sgml-dtd-4.1-native: fix recipe name
>>>    hwlatdetect: fix recipe name and add GIT revision to PV variable
>>>    lttng-ust: fix recipe name and add GIT revision to PV variable
>>>    mtd-utils: fix recipe name and add GIT revision to PV variable
>>>    neard: fix recipe name
>>>    rt-tests: fix recipe name add GIT revision to PV variable
>>>    update-rc.d: fix recipe name and add GIT revision to PV variable
>>
>> Some of these patches were meant to be dropped... so no ack from me.
>
> This really isn't filling me with confidence...
>

Sorry, I rushed this morning, the v2 and sgw/stage2 is correct now, and 
should only have 14 patches.

Sau!

> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

