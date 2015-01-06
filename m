Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5163C65C75
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 14:01:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 06:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="437075854"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.68])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2015 05:49:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Tue, 06 Jan 2015 14:01:48 +0000
Message-ID: <2069193.on9bJUeCyV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54A73A9D.8080903@gmail.com>
References: <cover.1418663308.git.akuster808@gmail.com>
	<1420021585.25779.14.camel@linuxfoundation.org>
	<54A73A9D.8080903@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Dizzy Merging
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
X-List-Received-Date: Tue, 06 Jan 2015 14:01:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 January 2015 16:41:01 akuster808 wrote:
> On 12/31/2014 02:26 AM, Richard Purdie wrote:
> > For the OE-Core patches, the gcc sysroot poison one should not go in.
> > I'd also question the udev changes and the gcc shared work changes since
> > those were fairly significant changes with a lot more risk.
> 
> no worries.

So, these patches are all still in your akuster/dizzy_1_7_1 branch. FWIW I 
agree, these aren't really stable branch material as far as I can tell.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

