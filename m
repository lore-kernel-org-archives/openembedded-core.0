Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC4865CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 10:32:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 10 Nov 2015 02:32:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="816162962"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by orsmga001.jf.intel.com with ESMTP; 10 Nov 2015 02:32:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Tue, 10 Nov 2015 10:32:40 +0000
Message-ID: <8515077.fH6JspMlML@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <5736d7f75445f625a8563050fcabc42ea7060d30.1447077439.git.mariano.lopez@linux.intel.com>
References: <cover.1447077439.git.mariano.lopez@linux.intel.com>
	<5736d7f75445f625a8563050fcabc42ea7060d30.1447077439.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 5/6] license.bbclass: Add function get_deployed_files
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
X-List-Received-Date: Tue, 10 Nov 2015 10:32:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 November 2015 14:04:42 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This function will get the files that were deployed in
> the image using the sstate-control manifest file. This
> will give a better view of what was deployed in the image.

Not *in* the image, next to it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

