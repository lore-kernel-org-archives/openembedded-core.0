Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1D009717ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 17:05:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Oct 2014 09:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,693,1406617200"; d="scan'208";a="616561723"
Received: from ncmcquil-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.155])
	by orsmga002.jf.intel.com with ESMTP; 10 Oct 2014 10:05:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Frazer, Will" <will.frazer@eurotech.com>
Date: Fri, 10 Oct 2014 18:05:07 +0100
Message-ID: <1471034.hcdbJUr2nb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <79508df9528e4e3d930335440c8ec2f0@DB4PR05MB397.eurprd05.prod.outlook.com>
References: <79508df9528e4e3d930335440c8ec2f0@DB4PR05MB397.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Additional dora backports for bash 4.2 ?
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
X-List-Received-Date: Fri, 10 Oct 2014 17:05:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Will,

On Thursday 09 October 2014 11:55:18 Frazer, Will wrote:
> Is there a view on whether the additional CVEs for bash will be backported
> to the dora branch for bash_4.2?
> 
> I'm thinking w.r.t. those that were discussed and/or applied recently to 4.3

The answer is yes, they will be, although we don't currently have them yet. I 
might try to do these over the weekend.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

