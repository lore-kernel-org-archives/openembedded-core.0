Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 275B070101
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 21:03:49 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1bunAM-00030M-2Y; Thu, 13 Oct 2016 23:03:50 +0200
Message-ID: <1476392622.4277.1.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Matt Madison <matt@madison.systems>
Date: Thu, 13 Oct 2016 22:03:42 +0100
In-Reply-To: <CAGgRHJoQWX=+WtcXzOTN4k6MLLerfCFFf8RJXVARpjug4+pYSw@mail.gmail.com>
References: <1476291665.16008.59.camel@pbcl.net>
	<CAGgRHJoQWX=+WtcXzOTN4k6MLLerfCFFf8RJXVARpjug4+pYSw@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: File conflicts in DL_DIR
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
X-List-Received-Date: Thu, 13 Oct 2016 21:03:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-10-12 at 11:03 -0700, Matt Madison wrote:
> I use ";downloadfilename=${BPN}-${PV}.tar.gz" to deal with this
> problem, and it's worked well for me.

Thanks, that works for me.

p.


