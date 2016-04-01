Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 95E3376312
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 10:01:20 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1alvtI-0006UI-Ta; Fri, 01 Apr 2016 12:01:21 +0200
Message-ID: <1459504875.2322.70.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 01 Apr 2016 11:01:15 +0100
In-Reply-To: <1459504783.2322.69.camel@pbcl.net>
References: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
	<1459504783.2322.69.camel@pbcl.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Fri, 01 Apr 2016 10:01:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-04-01 at 10:59 +0100, Phil Blundell wrote:
> On Fri, 2016-04-01 at 10:06 +0100, Ross Burton wrote:
> > Remove ancient and obsolete architectures from openembedded-core, they've no
> > real users and are causing complications that can be now removed.
> 
> It seems a bit harsh, or possibly wishful thinking on Intel's part, to
> describe most of these as "ancient and obsolete".

Oh, hah, I just realised what the date is.

Removing SPARC still seems like a fine idea though :-)

p.



