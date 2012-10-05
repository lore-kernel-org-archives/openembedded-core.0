Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TKAae-0003Om-UO
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 18:17:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Oct 2012 09:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="152859948"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Oct 2012 09:04:25 -0700
Message-ID: <506F0508.30404@linux.intel.com>
Date: Fri, 05 Oct 2012 09:04:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
References: <CAPhnLPCTDCOhz2Na9ehrWUbD0XQGos5HWbXyVS-LCVKLR2Ev9w@mail.gmail.com>
In-Reply-To: <CAPhnLPCTDCOhz2Na9ehrWUbD0XQGos5HWbXyVS-LCVKLR2Ev9w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] common-licenses: Adding bzip
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
X-List-Received-Date: Fri, 05 Oct 2012 16:17:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2012 12:41 PM, Flanagan, Elizabeth wrote:
> bzip requires it's own specific license.
>
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> ---
>   meta/files/common-licenses/bzip |   41 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 meta/files/common-licenses/bzip
>

Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/files/common-licenses/bzip b/meta/files/common-licenses/bzip
> new file mode 100644
> index 0000000..2162888
> --- /dev/null
> +++ b/meta/files/common-licenses/bzip
> @@ -0,0 +1,41 @@
> +--------------------------------------------------------------------------
> +
> +This program, "bzip2", the associated library "libbzip2", and all
> +documentation, are copyright (C) 1996-2010 Julian R Seward.  All
> +rights reserved.
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions
> +are met:
> +
> +1. Redistributions of source code must retain the above copyright
> +   notice, this list of conditions and the following disclaimer.
> +
> +2. The origin of this software must not be misrepresented; you must
> +   not claim that you wrote the original software.  If you use this
> +   software in a product, an acknowledgment in the product
> +   documentation would be appreciated but is not required.
> +
> +3. Altered source versions must be plainly marked as such, and must
> +   not be misrepresented as being the original software.
> +
> +4. The name of the author may not be used to endorse or promote
> +   products derived from this software without specific prior written
> +   permission.
> +
> +THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
> +OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
> +DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
> +GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> +WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> +SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +Julian Seward, jseward@bzip.org
> +bzip2/libbzip2 version 1.0.6 of 6 September 2010
> +
> +--------------------------------------------------------------------------
>


