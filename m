Return-Path: <saul.wold@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2349460232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 16:56:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Nov 2015 08:56:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,234,1444719600"; d="scan'208";a="809804380"
Received: from npmosele-mobl2.amr.corp.intel.com ([10.254.79.168])
	by orsmga001.jf.intel.com with ESMTP; 02 Nov 2015 08:56:19 -0800
Message-ID: <1446483378.18706.313.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Mon, 02 Nov 2015 08:56:18 -0800
In-Reply-To: <562F85E4.3090200@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-4-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LY2cDqCZe99YZP3bXuTq1bKdMaDAze6aEQJ2N1Vcb-K2g@mail.gmail.com>
	<562F85E4.3090200@pseudoterminal.org>
X-Mailer: Evolution 3.12.11 (3.12.11-1.fc21) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] gstreamer1.0-plugins-bad: upgrade to version 1.6.0
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
X-List-Received-Date: Mon, 02 Nov 2015 16:56:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-10-27 at 15:10 +0100, Carlos Rafael Giani wrote:
> On 10/26/2015 06:20 PM, Burton, Ross wrote:
> 
> > Hi Carlos,
> > 
> > On 27 September 2015 at 22:48, Carlos Rafael Giani
> > <dv@pseudoterminal.org> wrote:
> >         0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch is now
> >         in upstream, and therefore not needed as a separate patch
> >         anymore.
> >         
> >         Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> >         
> > 
> > 
> > I started looking for pieces to queue for when master re-opens and
> > discovered that this doesn't apply anymore, so the branch will need
> > rebasing.
> > 
> > 
> > Cheers,
> > Ross
> 
> Yes, I know. I am waiting until Jethro is released, then I'll send a
> v2 of these patches.
Please consider updating to the 1.6.1 release, which was just dropped in
the last couple of weeks?

Thanks
   Sau!

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



