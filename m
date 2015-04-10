Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 05E546ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:35:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2015 02:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,556,1422950400"; d="scan'208";a="706765138"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.27.173])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2015 02:35:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Lucian Musat <george.l.musat@intel.com>
Date: Fri, 10 Apr 2015 10:35:41 +0100
Message-ID: <2104184.cguCX4FLmb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1428566892-30526-3-git-send-email-george.l.musat@intel.com>
References: <1428566892-30526-1-git-send-email-george.l.musat@intel.com>
	<1428566892-30526-3-git-send-email-george.l.musat@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] oeqa/runtime: Boot test for poky-tiny.
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
X-List-Received-Date: Fri, 10 Apr 2015 09:35:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lucian,

On Thursday 09 April 2015 11:08:12 Lucian Musat wrote:
> Bug 6705.

* Could you please add a proper commit message to the patches in this series 
explaining what each one does (and preferably why). I appreciate most of it is 
simply adding something new, and a lot of us have gotten away with not adding 
them in the past, but we still really ought to have a commit message for every 
change. You may have seen this already but in case you haven't here is a 
guide:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

* Can you also please use the standard syntax for referencing bugs in the YP 
bugzilla i.e. [YOCTO #6705]

Thanks very much,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

