Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOyLl-0007CF-N4
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 23:41:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2012 14:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94767916"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Apr 2012 14:31:58 -0700
Message-ID: <4F9F04CD.7010109@linux.intel.com>
Date: Mon, 30 Apr 2012 14:31:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334159995-3392-1-git-send-email-florin.sarbu@windriver.com>
	<4F9EFEA5.1080407@linux.intel.com>
	<1335820179.3133.172.camel@x121e.pbcl.net>
In-Reply-To: <1335820179.3133.172.camel@x121e.pbcl.net>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 21:41:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2012 02:09 PM, Phil Blundell wrote:
> On Mon, 2012-04-30 at 14:05 -0700, Saul Wold wrote:
>> Also, until we get serious about systemd in poky, I think this patch
>> will be on hold, it is something we are going to work on for 1.3.
>
> I'm not quite sure I understand what poky has to do with it.  If this
> patch is a poky-specific thing then presumably it should be in some poky
> layer and not in oe-core at all.  Conversely, if it isn't a
> poky-specific thing then it doesn't seem as though it should be
> contingent on poky "getting serious" about anything.
>
Phil, My fingers spoke faster than my brain on this one ;-)

It should be OE-Core, as this is the OE-Core list, and we will working 
to update OE-Core with a systemd setup, there are a few things that we 
need to work out first around the configurability.

Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


