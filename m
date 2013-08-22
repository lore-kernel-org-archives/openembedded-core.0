Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8B36A8B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:58:48 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1VCRfD-00012l-Qu
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Aug 2013 11:58:47 +0200
Message-ID: <1377165527.17787.125.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 10:58:47 +0100
In-Reply-To: <6560539.TdGG90GaLI@helios>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 09:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 10:07 +0100, Paul Eggleton wrote:
> On Wednesday 21 August 2013 22:58:55 Saul Wold wrote:
> >   package_rpm.bbclass:Make the regexp less greedy

That's a rather poor commit message.  There are multiple regexps in this
class and none of them is famous enough to be adequately described as
"the regexp".

p.


