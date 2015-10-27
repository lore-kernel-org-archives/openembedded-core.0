Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 146EF75CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:40:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Oct 2015 06:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,205,1444719600"; d="scan'208";a="588914189"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Oct 2015 06:40:37 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A7B346A4005;
	Tue, 27 Oct 2015 06:39:34 -0700 (PDT)
Date: Tue, 27 Oct 2015 15:40:31 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Noor_Ahsan@mentor.com
Message-ID: <20151027134031.GA12305@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: U-boot file is being removed when image-recipe is rebuild which uses wic.bz2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 13:40:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Noor,

Sorry for delay. I missed your e-mail somehow.

Can you please show your recipe, wks file and the details of your build
configuration(MACHINE, bblayers, etc) ?

---
Regards,
Ed

