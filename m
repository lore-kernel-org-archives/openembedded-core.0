Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 32D536B6D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 16:56:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Feb 2014 08:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,773,1384329600"; d="scan'208";a="475227443"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.157])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2014 08:55:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 03 Feb 2014 16:55:51 +0000
Message-ID: <4183008.ogJDUr4ZCT@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <CAMKF1srJGVP2jDMCFOybHyzjX8XqBFe5Gmh-piSFr9z2nwoqCQ@mail.gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
	<5994492.lfGcDNr6jJ@peggleto-mobl5.ger.corp.intel.com>
	<CAMKF1srJGVP2jDMCFOybHyzjX8XqBFe5Gmh-piSFr9z2nwoqCQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Scott Rifenbark <srifenbark@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Add python 3 support
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
X-List-Received-Date: Mon, 03 Feb 2014 16:56:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 February 2014 08:49:36 Khem Raj wrote:
> On Mon, Feb 3, 2014 at 4:03 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > I see this series has been merged at last - great! Could you also send
> > Scott some information about documentation changes that we should have
> > for this?
>
> I will send another patch to define a python3 packagegroup and I think
> it would be then
> good to document how to include python3 feature in images.

Well, there's that, but you've also additional variables (e.g. PYTHON_ABI and 
PYTHON_PN).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

