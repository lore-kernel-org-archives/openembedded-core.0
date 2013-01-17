Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1TvqCt-0005Xu-Ll
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 15:12:53 +0100
Received: by mail-ob0-f174.google.com with SMTP id ta14so2554081obb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 05:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=BDjNRiTsQxXtFvIlodoPVEqjEaalYwBdESNyIYmntLI=;
	b=azKbwMc+bDDgbhmwi1JcmId28xioTjTahoUzFvZaO8HRRve7VVaPiTb6PqCTAaBrLJ
	+ij2YPaV5iVe4KENRFnOBFewiXvW6sQjt7sk0X89u2vM5ib8zyAoUopQ5Z9DL38ppTse
	/MNBmu8dTWvSZ7Rgdnod/D94C+6iIrUN/dLdVn5vM/0ODNSEhzPtdklv5selBLdILUyS
	FXp9O/bW2odrBy9bOR8TJthKlGvvnHpTrtZ++Jx1Yo/lKaArZ8Ano37Q2tuHYBynENd4
	BsWUOMcoRSc0g2fiQPY13ZO2rQmmjUUHrd+i6Lk+46hdPwAtAmRQpBwuZpBSQOHAp11g
	AbUw==
MIME-Version: 1.0
X-Received: by 10.182.12.106 with SMTP id x10mr2999959obb.34.1358431036070;
	Thu, 17 Jan 2013 05:57:16 -0800 (PST)
Received: by 10.60.58.37 with HTTP; Thu, 17 Jan 2013 05:57:15 -0800 (PST)
In-Reply-To: <1358337843.8129.5.camel@ted>
References: <50F5699A.207@nedap.com>
	<1358337843.8129.5.camel@ted>
Date: Thu, 17 Jan 2013 05:57:15 -0800
Message-ID: <CAGDS+nkFTPwMQwybNDu1_xAH3BOpi70h68YEf3wnNY_DLMuurw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: signing ipk packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 14:12:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 16, 2013 at 4:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Steve Sakoman may have posted something in the archives about his
> experiences but I'm not 100% sure.

Richard - I'm using signed rpm repositories, haven't done anything with ipk!

Steve


