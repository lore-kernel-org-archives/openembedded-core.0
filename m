Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0C160169
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 15:40:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2014 08:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,390,1406617200"; d="scan'208";a="472094675"
Received: from rrhewawa-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.41])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2014 08:40:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Roxana Ciobanu <roxana.ciobanu@intel.com>
Date: Sun, 24 Aug 2014 16:40:30 +0100
Message-ID: <19046583.Ibnkefnmph@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] Fix for YB6538
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
X-List-Received-Date: Sun, 24 Aug 2014 15:40:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roxana,

On Friday 22 August 2014 11:49:36 Roxana Ciobanu wrote:
> The following changes since commit c1ee6cdfde5d1fe5f38a1e8eef5b7b0dd086df95:
> 
>   README: add required version for django-nvd3 (2014-03-06 13:43:30 +0200)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib roxana/YB6538
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6538
> 
> Roxana Ciobanu (9):
>   error-report: add 'Submitted on' column
>   error-report: add 'Submitted on' detail
>   error-report: add 'Submitter' column
>   error-report: add 'Edit columns' menu
>   jquery.cookie.js: add the Cookie Plugin
>   error-report: remember state of the menu
>   error-report: sort table by 'Submitted on' column
>   error-report: add css customization
>   error-report: add top 'Show rows' menu

Merged, thanks. In future if you could send patches to the 
yocto@yoctoproject.org mailing list rather than this one that would be great 
(I noticed this wasn't mentioned in the README file so I've just added it.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

