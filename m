Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QYezr-0007XK-Or
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:58:39 +0200
Received: by yib18 with SMTP id 18so2254833yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HKhzE+3d0aVOvkdlNRRIs0awLh0WpHIINZgdyOUL/Ho=;
	b=Qh4V/OuIOt1cXRG9d553aiZL+7dgNyNEsyQDoQhp1vqObuhgtM8MZ9vz4sxBopjvbW
	NuoPDkWdjMoDiVEibf+EbqBi4vcfN8I1z6mjrNivDFw3Px3tv0SW3Lz9NgKm5WOXnW3m
	sP62cITcy/4A+O6e8KRogLE3Ym85ZPpA+iBpk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=mDk3xq4vkNdUCEJ+Xxbp9beabbiXmuasYI/RV3r4J34bfH3XBAWeYSDeZqxFNvFazT
	MW0AUBa3cq0Wa7tcJaDjc12Z5PVto8VBoaacri/bm94i9KY/bU8mi7n5urWS0/vbDyNg
	xtyZsqbPmknfTn6reXsbiAfk/D1JGpOySMz0M=
MIME-Version: 1.0
Received: by 10.236.0.202 with SMTP id 50mr779631yhb.486.1308578101781; Mon,
	20 Jun 2011 06:55:01 -0700 (PDT)
Received: by 10.236.202.69 with HTTP; Mon, 20 Jun 2011 06:55:01 -0700 (PDT)
In-Reply-To: <BANLkTim2jbiaWy0orBycqpGrC8bdiR_CVw@mail.gmail.com>
References: <E1QXzLA-0004Ca-IU@happy.bec-systems.com>
	<201106181840.38875.paul.eggleton@linux.intel.com>
	<BANLkTim2jbiaWy0orBycqpGrC8bdiR_CVw@mail.gmail.com>
Date: Mon, 20 Jun 2011 09:55:01 -0400
Message-ID: <BANLkTi=O0gqNM-2QOuNKWebiu7=3O4G9Og@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE Changelog for 2011-06-6 to 2011-06-13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2011 13:58:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jun 18, 2011 at 3:34 PM, Chris Larson <clarson@kergoth.com> wrote:
> Speaking of which, if we do that, might be a good idea to add bitbake
> itself specifically, in case any of the changes to master will impact
> the userbase.

Done, thanks.
Cliff

-- 
=================
http://bec-systems.com


