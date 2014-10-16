Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0856AD01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 14:11:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 16 Oct 2014 07:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,732,1406617200"; d="scan'208";a="590182235"
Received: from tdupatis-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.168])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2014 07:11:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Thu, 16 Oct 2014 15:11:09 +0100
Message-ID: <2094930.R4GYK1xCqk@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.4-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1553851.CnfIPHfleq@peggleto-mobl5.ger.corp.intel.com>
References: <8e08223121ae4a6eb3c512a0d4402c59@BLUPR05MB037.namprd05.prod.outlook.com>
	<1553851.CnfIPHfleq@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Status of Shellshock backport for dylan?
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
X-List-Received-Date: Thu, 16 Oct 2014 14:11:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 October 2014 13:47:56 Paul Eggleton wrote:
> On Thursday 16 October 2014 12:35:46 Bryan Evenson wrote:
> > I see that a pull request for backporting the Shellshock fix to the dylan
> > branch had been submitted a few days ago:
> > 
> > http://patchwork.openembedded.org/patch/81571/
> > 
> > but the pull request has not made it to the oe-core dylan branch.  Is
> > there
> > more testing that needs to be done on this one for dylan, or is there
> > something else holding up pulling in the fix?
> 
> Nothing that I'm aware of. Richard could you please merge this?

FYI these are now merged into the dylan branch - thanks Richard.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

