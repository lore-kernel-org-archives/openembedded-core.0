Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BFBBC6DE52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 18:25:27 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W2mCW-0001tZ-7R; Mon, 13 Jan 2014 19:25:28 +0100
Message-ID: <1389637527.19023.4.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Mon, 13 Jan 2014 18:25:27 +0000
In-Reply-To: <52D42D89.4050106@linaro.org>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<52D42D89.4050106@linaro.org>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Mon, 2014-01-13 at 13:16 -0500,
	Trevor Woerner wrote: >
	Since OE is generally used to build Linux distributions,
	I'm rather > curious
	to know why OE would include tunes for CortexM3? Well,
	Cortex-M can run uClinux.
	And "generally" != "exclusively". [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Cortex M3 tune fixes
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
X-List-Received-Date: Mon, 13 Jan 2014 18:25:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-13 at 13:16 -0500, Trevor Woerner wrote:
> Since OE is generally used to build Linux distributions, I'm rather
> curious to know why OE would include tunes for CortexM3?

Well, Cortex-M can run uClinux.  And "generally" != "exclusively".

p.



