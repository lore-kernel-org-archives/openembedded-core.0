Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1QN910-0008C6-6r; Thu, 19 May 2011 21:36:10 +0200
Received: by fxm19 with SMTP id 19so2612050fxm.6
	for <multiple recipients>; Thu, 19 May 2011 12:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2jC9JpkG0rCtFS+RmhbnZbBzIXvnPMkwi+uqHQH5j74=;
	b=mO7t1kCW0BK2BBizZLrF9BERzcgA4CmUZyjuxTFMP1D0Mkf8DuoUpg8tGgU2MMDZZ7
	72PrP2Uy/uG00fuunVGtG4VdsZYU06dbctvVKNqEfGbR0/mClfJi1IthwF854zYMBg7D
	1DpeQedNyHhitwUcHE6MM7dgMP42Hhze1hJEQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XatHiQqQ3ieBOcZRe2ITZ3vtnvXZAYqdcyfx9L5nh4D30MkCCyP3dbJOv2urnUiilX
	/CwX3RsY67WYAKCmsczYR3/PaZXK7o1lkcte8W1NzbQaXva+JC0Wy6xx/sJAEaUTmwdj
	PjLkD8I2XLq+jn5RnGvsIarffkUp3hyBRPqPU=
Received: by 10.223.10.150 with SMTP id p22mr1655643fap.86.1305833594327;
	Thu, 19 May 2011 12:33:14 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 19sm1185887faf.5.2011.05.19.12.33.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 12:33:13 -0700 (PDT)
Date: Thu, 19 May 2011 21:33:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110519193306.GA3235@jama.jama.net>
References: <E1QN7Sg-0003y1-3F@happy.bec-systems.com>
	<BANLkTimEO3P8JmjcS9s50yqJWB=nBAkq+Q@mail.gmail.com>
	<BANLkTinY3fkK5oK58EC-yXmW37VZkbiV4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTinY3fkK5oK58EC-yXmW37VZkbiV4w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] OE Changelog for 2011-4-8 to 2011-4-15
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
X-List-Received-Date: Thu, 19 May 2011 19:36:10 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2011 at 12:14:59PM -0700, Chris Larson wrote:
> On Thu, May 19, 2011 at 11:43 AM, Cliff Brake <cliff.brake@gmail.com> wro=
te:
> > Are there any other repos or maillists that I should include in this
> > report? =A0I'm trying to increase visibility in what all the projects
> > are doing, so we can reduce duplication of work in various layers.
>=20
> There's a meta-slugos now, and pb is hosting a meta-micro. Those are
> all that come to mind off the top of my head. Not sure how much you
> want to include :)

There's also meta-smartphone
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dsummary

with few layers:
meta-fso
meta-htc
meta-nokia
meta-openmoko
meta-palm
meta-shr
meta-zaurus
maybe with meta-aurora later

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn--
