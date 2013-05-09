Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UaW59-0004bo-SE
	for Openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 21:00:48 +0200
Received: by mail-ob0-f175.google.com with SMTP id wd20so3237876obb.6
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 11:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=FvQhgPK6D7WSGcuuQuq0qkvYKFCjQnKE633FNC+u1o4=;
	b=P7VtMh6/uznB1JyitP1zx7msaKiRF2w/8ULfI5L/AfWTnSj43MWLx9ZhTeUBKwfGhx
	79Pvx0PSD1zdLisGZgCMnftaCIyAZyKeygemYDbgRB0m7R8D6YT1ALlrSdiZjcxwcnp/
	I7UJyGBHCwmDa1Qv25msN+lsANYBuT+7OKn15e+1G7p7UfnPxhnhRu7e84Fe+d2+LZVL
	l3N+l+Iylp9UEx1PacQjDmf3jv3B6KXBOLH3UCb1qlffa/7l1TKI/YrQbCzW/TWsz70o
	xjaH8EXdzYfleeeTNZgLKBYgYIektao8zvy4gRz94YvqA5TPSEuw4ZYu7t1jvDIEjAmE
	pZwg==
MIME-Version: 1.0
X-Received: by 10.60.34.135 with SMTP id z7mr5027654oei.68.1368124962797; Thu,
	09 May 2013 11:42:42 -0700 (PDT)
Received: by 10.76.160.70 with HTTP; Thu, 9 May 2013 11:42:42 -0700 (PDT)
In-Reply-To: <518BD58B.1030307@linaro.org>
References: <518BD58B.1030307@linaro.org>
Date: Thu, 9 May 2013 14:42:42 -0400
Message-ID: <CAHUNapTEOfwR9OATGGKOtrpHWwisVh0xXm5P2jKUgEitznpxNw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Lists Linaro-dev <linaro-dev@lists.linaro.org>,
	Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Changes in Linaro layers for OpenEmbedded
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
X-List-Received-Date: Thu, 09 May 2013 19:00:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 9, 2013 at 12:57 PM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> Who will maintain those layers after my leave? This was not decided yet.
> There are few guys at Linaro who know how to use OpenEmbedded but most
> of them is outside of Builds and Baselines team.

To me this implies that these layers and this effort of yours isn't
part of any "official" Linaro build process/procedure. Would this
assumption be correct?


