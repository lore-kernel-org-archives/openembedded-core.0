Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 11A7A6B485
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 10:04:10 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V46ml-00046u-1e; Tue, 30 Jul 2013 12:04:07 +0200
Message-ID: <1375178646.13247.50.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Tue, 30 Jul 2013 11:04:06 +0100
In-Reply-To: <CAJTo0LZk9HR12mR7nozaE0yZ-DjMPkagf1GvagEeKmkF2i6M9A@mail.gmail.com>
References: <cover.1375164419.git.sgw@linux.intel.com>
	<CAJTo0LZk9HR12mR7nozaE0yZ-DjMPkagf1GvagEeKmkF2i6M9A@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (M3 rc1) 00/26] Needs early review and ACK
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
X-List-Received-Date: Tue, 30 Jul 2013 10:04:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 10:46 +0100, Burton, Ross wrote:
> On 30 July 2013 07:14, Saul Wold <sgw@linux.intel.com> wrote:
> > Saul Wold (2):
> >   bluez5: Add obex as a PACKAGECONFIG and package seperately
> 
> I'm still unsure why this patch was needed.  I've nothing against
> splitting out the OBEX functionality and controlling it with a
> packageconfig, but this does disable it by default when before it was
> enabled.

Was that patch ever actually posted to the list?  I don't recall seeing
it in my inbox and I can't find it in the ML archive on the web.

p.



