Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 65E1178399
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:58:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 15 Jun 2017 09:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="1182963283"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2017 09:58:33 -0700
Message-ID: <1497546453.29576.23.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 12:07:33 -0500
In-Reply-To: <CAJTo0LZ6SdbAv0cHjiHpbKq+WC7-HEG1D4k4XXM8V6xBdJO9JA@mail.gmail.com>
References: <1497533249.3942.94.camel@linuxfoundation.org>
	<1497543585-32012-1-git-send-email-ed.bartosh@linux.intel.com>
	<1497545468.29576.22.camel@linux.intel.com>
	<CAJTo0LZ6SdbAv0cHjiHpbKq+WC7-HEG1D4k4XXM8V6xBdJO9JA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Thu, 15 Jun 2017 16:58:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-15 at 17:47 +0100, Burton, Ross wrote:
> 
> On 15 June 2017 at 17:51, Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>         also, should it be a warning instead?
>         
> 
> 
> Not if the logic to use the value has been deleted!

Oh, I see that logic removal! sorry for the noise.

> 
> Ross 
> 
> 



