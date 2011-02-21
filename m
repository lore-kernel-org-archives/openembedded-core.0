Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PrbNY-0006iq-6f
	for openembedded-core@lists.linuxtogo.org;
	Mon, 21 Feb 2011 20:25:04 +0100
Received: by gxk1 with SMTP id 1so2437605gxk.6
	for <openembedded-core@lists.linuxtogo.org>;
	Mon, 21 Feb 2011 11:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=I6C8H+U/XnRwmQgfAhOgPQ2ZRDuMEj+s0MMjtfxa6RY=;
	b=b+AcVY/bTHdcidPRSsVfYpODj2KFeo9NZA3roao00V2FNpbJnBuHq1hMqdK4PYzbU4
	swm9ndgk9i6WhUBSwq7yajJuoNdBX56/FaF4Jcu1yi0/5v/glRQtGCyqEWfBC0XSIC5J
	MDRN1tMzpxPo9JiNm/wPoaCQeXuUT+ztC0s6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oDqo3wcBJnQjdKEZvKLS4mhXsgZrLF/ASAB1sqtEmVMLHOupifuIhsuuWSiLFnt/TO
	2BzcLZWXNcPuFgSKfgX7a2B79N4YwWPN+LitoLsF/JgxmC/L0FeRMCRumHnniotJ0pCY
	zjYBJLpC79E94cCkFOKKwNlZsiMnK7WY/UoGg=
Received: by 10.151.78.13 with SMTP id f13mr2137064ybl.135.1298316225363;
	Mon, 21 Feb 2011 11:23:45 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u35sm994838yba.7.2011.02.21.11.23.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Feb 2011 11:23:44 -0800 (PST)
Date: Mon, 21 Feb 2011 11:23:52 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Message-ID: <20110221192352.GD10070@sakrah.homelinux.org>
References: <8E7ADF40-9602-40FD-8298-636A5EF72740@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <8E7ADF40-9602-40FD-8298-636A5EF72740@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Repo status
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Feb 2011 19:25:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/02/11 09:31), Koen Kooi wrote:
> Hi,
> 
> What's the status on the oe-core repo?
> 

I have it setup. I have also a local copy of yocto ready to be pushed to
populate it. I have only removed bitbake from it thus far. I did not
push it since I thought to do it after todays meeting and if there were
more to come in this regard

> regards,
> 
> Koen
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


