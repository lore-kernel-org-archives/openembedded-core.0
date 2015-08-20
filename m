Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 842A565CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:54:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 02:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="545302028"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 02:54:34 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 1587E6A4087; Thu, 20 Aug 2015 02:53:46 -0700 (PDT)
Received: from 10.252.47.114
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 20 Aug 2015 12:53:46 +0300 (EEST)
Message-ID: <51481.10.252.47.114.1440064426.squirrel@linux.intel.com>
In-Reply-To: <CAJTo0LaJ=sUw9-9h4ZHUn3eQrPpODARpWyVB=94kaATi14HMHA@mail.gmail.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<55D4EC10.9060001@gmail.com>
	<CAJTo0LaJ=sUw9-9h4ZHUn3eQrPpODARpWyVB=94kaATi14HMHA@mail.gmail.com>
Date: Thu, 20 Aug 2015 12:53:46 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Burton, Ross" <ross.burton@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/22] Update webkitgtk to latest stable upstream; replace midori with epiphany
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
X-List-Received-Date: Thu, 20 Aug 2015 09:54:34 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On 19 August 2015 at 21:50, akuster808 <akuster808@gmail.com> wrote:
>
>> Do we have any idea how long this will be before hitting master-next?
>>
>> I am leaning towards sending an update to meta-ruby while this patches
>> series makes it way through the process.
>>
>
> I'm actively looking at it now - M3 deadline is next week.

Great! I'll rebase and incorporate changes based on latest feedback, but
only after the patchset (partly) made its way to master. I'm stuck at home
with a cold today, so will look at other things to fix (the broken rpm/db
update) for now.

Alex

