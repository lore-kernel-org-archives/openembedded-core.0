Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 627E578283
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 09:36:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 02:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,383,1496127600"; d="scan'208";a="995069017"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 20 Jul 2017 02:36:25 -0700
Date: Thu, 20 Jul 2017 12:36:21 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Jason Liu <jason.liu@gumstix.com>
Message-ID: <20170720093621.GB17156@mbabyjoh-desk.ger.corp.intel.com>
References: <CAGkS5bk6MHaROpUXNUytnR7JHhP1yWk29WR+hOQmPqeaBSWSnA@mail.gmail.com>
	<CAGkS5b=rJ-YBbaqV1-8T_PF9j4L1ReuCY3i7m-3hb_NHd2JtcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGkS5b=rJ-YBbaqV1-8T_PF9j4L1ReuCY3i7m-3hb_NHd2JtcA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Nothing PROVIDES 'libvdpau'
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
X-List-Received-Date: Thu, 20 Jul 2017 09:36:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

On Wed, Jul 19, 2017 at 10:34:36AM -0700, Jason Liu wrote:
> Hello Openembedded,
>

For recipes in "meta-openembedded", you will get faster response from
"openembedded-devel@lists.openembedded.org" mailing list.

>Currently I have a compile error saying: Nothing PROVIDES 'libvdpau'.
>I opened a issue on git but I think nobody are watching the git one so I post here.

'libvdpau' is available in "meta-openembedded/meta-oe". Have you added it in the "bblayers.conf" ?

>The detail can be seen here: https://github.com/openembedded/meta-openembedded/issues/47
(replied there as well)

>Regards,
>Jason


